//
//  ExploreCategoryCell.swift
//  Groceries
//
//  Created by MacBook on 5/15/24.
//

import SwiftUI

struct ExploreCategoryCell: View {
    var color : Color
    var imageName: String
    var cellName: String
    var didAddCart : (() -> ())?
    
    var body: some View {
        VStack(spacing:5){
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 120)
                .cornerRadius(15)
                .clipped()
            
            Spacer()
            
            Text(cellName)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

            Spacer()
        }
        .frame(width: 150, height: 150)
        .padding(15)
        .background(color.opacity(0.3))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(color, lineWidth: 1)
        )
    }
}

#Preview {
    ExploreCategoryCell(color: Color.yellow, imageName: "perfumes", cellName: "Perfumes")
        .padding(20)
    
}
