//
//  NutritionRow.swift
//  Groceries
//
//  Created by MacBook on 5/3/24.
//

import SwiftUI

struct NutritionRow: View {
    let name: String
    @State var value : String = "214"
    
    var body: some View {
        HStack{
            Text(name)
                .font(.customfont(.medium, fontSize: 20))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Text(value)
                .font(.customfont(.medium, fontSize: 20))
                .foregroundColor(.secondaryText)
          
        }
    }
}

#Preview {
    NutritionRow(name: "Calories")
}
