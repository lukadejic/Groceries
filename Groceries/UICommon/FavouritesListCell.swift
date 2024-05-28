//
//  FavouritesListCell.swift
//  Groceries
//
//  Created by MacBook on 5/4/24.
//

import SwiftUI

struct FavouritesListCell: View {
    let product: Product
    
    var body: some View {
        
        HStack{
            AppetizerRemoteImage(urlString: product.thumbnail)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 15){
                Text(product.title)
                    .font(.customfont(.semibold, fontSize: 23))
                
                Text("\(product.price)$")
                    .font(.customfont(.regular, fontSize: 15))
            }
            .padding(.leading)
            
        }
        .padding(.horizontal, 20)
        
    }
}

#Preview {
    FavouritesListCell(product: MockData.sampleProduct)
}
