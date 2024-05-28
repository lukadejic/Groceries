//
//  FavouriteView.swift
//  Groceries
//
//  Created by MacBook on 5/4/24.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var favouriteVM : FavouriteViewModel
    
    var body: some View {
        
        ZStack{
            VStack{
                List{
                    ForEach(favouriteVM.favItems) { product in
                        FavouritesListCell(product: product)
                    }
                    .onDelete(perform: favouriteVM.deleteItems)
                }
                .listStyle(PlainListStyle())
                if(!favouriteVM.favItems.isEmpty){
                    RoundButton(title: "Add To Cart")
                        .padding(.bottom, .bottomInsets + 60)
                        .padding(.horizontal, 20)
                }
            }
       
            if(favouriteVM.favItems.isEmpty){
                EmptyState(imageName: "FavouritesEmpty", message: "Your favourite tab is empty")
            }
        }
        .navigationTitle("Favourites")
        .onAppear {
            favouriteVM.loadFavItems()
        }
    }
}
#Preview {
    FavouriteView()
        .environmentObject(FavouriteViewModel())
}
