//
//  Preview.swift
//  Groceries
//
//  Created by MacBook on 5/3/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    @StateObject var ratingVM = RatingViewModel()
 
    var body: some View {
        HStack{
            Text("Preview")
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 2) {
                ForEach(1..<ratingVM.maximumRating + 1, id: \.self){number in
                    
                    Button{
                        rating = number
                    }label: {
                        ratingVM.image(for: number)
                            .foregroundStyle(number > rating ? ratingVM.offColor : ratingVM.onColor)
                    }
                    
                }
            }
            
        }
        .padding(.horizontal, 20)
    }
    
}

#Preview {
    RatingView(rating: .constant(4))
}
