//
//  ProductDetailList.swift
//  Groceries
//
//  Created by MacBook on 5/3/24.
//

import SwiftUI

struct ProductDescription: View {
    let product : Product
    @Binding var isShowDetail : Bool
    @State var name : String = "Product Details"
    

    var body: some View {
        VStack {
            HStack{
                Text(name)
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Button{
                    withAnimation {
                        isShowDetail.toggle()
                    }
                }label: {
                    Image(isShowDetail ? "detail_open": "next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .padding(15)
                }
                .foregroundColor(Color.primaryText)
                
            }
            if(isShowDetail){
                
                Text(product.description)
                    .font(.customfont(.medium, fontSize: 15))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
            }
            Divider()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProductDescription(product: MockData.sampleProduct, isShowDetail: .constant(true))
}
