//
//  ExploreView.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI

struct ExploreView: View {
   
    @StateObject var exploreVM = ExploreViewModel()
    @StateObject var exploreItemsVM = ExploreItemViewModel()
    
    var colums = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                
                VStack{
                    HStack{
                        Spacer()
                        Text("Find Products")
                            .font(.customfont(.bold, fontSize: 20))
                            .frame(height: 46)
                        
                        Spacer()
                    }
                    .padding(.top, .topInsets)

                    SearchTextField(placholder: "Search Store", txt: $exploreVM.txtSearch)
                        .padding(.horizontal, 5)
                        .padding(.bottom, 4)
                    
                    ScrollView{
                        LazyVGrid(columns: colums, spacing: 15) {
                            ForEach(exploreVM.cells){cell in
                                ExploreCategoryCell(color: cell.color, imageName: cell.imageName, cellName: cell.cellName)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 50)
                    }
                    
                }
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ExploreView()
}
