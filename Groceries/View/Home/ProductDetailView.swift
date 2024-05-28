//
//  ProductDetailView.swift
//  Groceries
//
//  Created by MacBook on 5/3/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var mode
    @StateObject var detailVM  = ProductDetailViewModel()
    @StateObject var productVM = ProductViewModel()
    @EnvironmentObject var favouriteVM : FavouriteViewModel
    
    
    let product : Product
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(hex: "F2F2F2"))
                            .frame(width: .screenWidth, height: .screenWidth * 0.8)
                            .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                        
                        AppetizerRemoteImage(urlString: product.thumbnail)
                            .frame(width: .screenWidth, height: .screenWidth * 0.79)
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    .frame(width: .screenWidth, height: .screenWidth * 0.8)
                    
                    VStack{
                        
                        HStack{
                            Text(product.title)
                                .font(.customfont(.bold, fontSize: 24))
                                .foregroundColor(.primaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            Button{
                                detailVM.isFav.toggle()
                                
                                if(detailVM.isFav){
                                    favouriteVM.add(product)
                                }else{
                                    favouriteVM.removeProduct(product, from: &favouriteVM.favItems)
                                }
                                
                            }label: {
                                Image(detailVM.isFav ? "favorite" : "fav")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                            }
                            .foregroundColor(Color.secondaryText)
                            
                        }
                        .padding(.bottom,20)
                        
                        HStack{
                            Button{
                                detailVM.addSubQTY(isAdd: false)
                            }label: {
                                Image("subtack")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            
                            Text("\(detailVM.qty)")
                                .font(.customfont(.bold, fontSize: 24))
                                .foregroundColor(.primaryText)
                                .multilineTextAlignment(.center)
                                .frame(width: 45, height: 45, alignment: .center)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.placeholder.opacity(0.5),lineWidth: 1)
                                )
                            
                            Button{
                                detailVM.addSubQTY(isAdd: true)
                                
                            }label: {
                                Image("add_green")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            
                            Spacer()
                            
                            Text("\(Double(product.price) * Double(detailVM.qty) ,specifier: "%.2f")$")
                                .font(.customfont(.bold, fontSize: 28))
                                .foregroundColor(.primaryText)
                            
                        }
                        .padding(.vertical, 8)
                        
                        Divider()
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    ProductDescription(product: product, isShowDetail: $detailVM.isShowingDescription, name: "Description")
                    
                    ProductDetails(product: product, isShowDetail: $detailVM.isShowingProductDetails, name: "Product Details")
                    
                    RatingView(rating: $productVM.rating)
                    
                    RoundButton(title: "Add To Basket")
                    .padding(20)
                }
                
                VStack{
                    HStack{
                        
                        Button{
                            withAnimation(.spring) {
                                mode()
                            }
                        }label: {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.primaryApp)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal, 20)
                
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear(perform: {
                detailVM.isFav = favouriteVM.favItems.contains { $0.id == product.id }
            })
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


#Preview {
    ProductDetailView(product: MockData.sampleProduct)
        .environmentObject(FavouriteViewModel())
}


