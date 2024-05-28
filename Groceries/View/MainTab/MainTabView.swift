//
//  MainTabView.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        
        ZStack{
            if (homeVM.selectedTab == 0){
                HomeView()
            }else if (homeVM.selectedTab == 1){
                ExploreView()
            }else if (homeVM.selectedTab == 2){
                ExploreView()
            }else if (homeVM.selectedTab == 3){
                FavouriteView()
            }else if (homeVM.selectedTab == 4){
                ProfileView()
            }
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    ForEach(homeVM.tabs){item in
                        TabButton(title: item.title, icon: item.icon, isSelected: self.homeVM.selectedTab == item.index) {
                            DispatchQueue.main.async {
                                withAnimation {
                                    self.homeVM.selectedTab = item.index
                                }
                            }
                        }
                        
                    }
                    
                }
                .padding(.top, 10)
                .padding(.bottom,.bottomInsets)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            }
        }
        .padding(.top, 35)
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
}

#Preview {
    MainTabView()
        .environmentObject(AuthViewModel())
        .environmentObject(FavouriteViewModel())
    
}
