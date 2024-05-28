//
//  HomeView.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    @StateObject var productVM = ProductViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack{

                        HStack{
                            Image("location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 15)
                            
                            
                            Text("Belgrade, Serbia")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.darkGray)
                            
                        }
                       
                        
                    }
                    .padding(.top,.topInsets)

                    SearchTextField(placholder: "Search Store", txt: $homeVM.txtSearch)
                    
                    
                    SectionTitleAll(title: "Technology", titleAll: "See All")
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 15){
                            ForEach(productVM.products.prefix(10)){ product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductCell(product: product)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    
                    SectionTitleAll(title: "Hygiene", titleAll: "See All")
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 15){
                            ForEach(productVM.products.dropFirst(10).dropLast(10)){ product in
                                
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductCell(product: product)
                                }
                                
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    
                    SectionTitleAll(title: "Groceries", titleAll: "See All")
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 15){
                            ForEach(productVM.products.dropFirst(20).dropLast(5)){ product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductCell(product: product)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    
                    SectionTitleAll(title: "Decoration", titleAll: "See All")
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 15){
                            ForEach(productVM.products.dropFirst(25)){ product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductCell(product: product)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    .padding(.bottom, .bottomInsets + 60)
                }
                
            }
            .task{
                productVM.getProducts()
            }
            .ignoresSafeArea()
        }

        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
        .environmentObject(FavouriteViewModel())
}
