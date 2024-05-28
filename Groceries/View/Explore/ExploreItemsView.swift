//
//  ExploreItemsView.swift
//  Groceries
//
//  Created by MacBook on 5/15/24.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var itemsVM = ExploreItemViewModel()
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        
                        Button{
                            withAnimation(.spring) {
                                dismiss()
                            }
                        }label: {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.primaryApp)
                        }
                        
                        Spacer()
                        
                        Button{
                            
                        }label: {
                            Image("filter_ic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                    }
                    ScrollView{
                        LazyVGrid(columns: columns){
                            ForEach(itemsVM.items){item in
                            ProductCell(product: item)
                            }
                        }
                        .padding(.bottom, .bottomInsets + 60)
                    }
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    ExploreItemsView()
}
