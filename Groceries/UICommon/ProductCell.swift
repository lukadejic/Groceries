//
//  ProductCell.swift
//  Groceries
//
//  Created by MacBook on 4/24/24.
//

import SwiftUI

struct ProductCell: View {
    
    let product : Product
    
    var didAddCart : (()->())?
    
    var body: some View {
        
        VStack{
            
            AppetizerRemoteImage(urlString: product.thumbnail)
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 130)
                .cornerRadius(15)
            
            Spacer()
            
            Text(product.title)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
            Text(product.description)
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack{
                Text("\(String(product.price))$")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button{
                    didAddCart?()
                }label: {
                    Image("addButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background(Color.primaryApp)
                .cornerRadius(15)
            }
            
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5),lineWidth: 1)
        )

    }
}

#Preview {
    ProductCell(product: MockData.sampleProduct)
}
