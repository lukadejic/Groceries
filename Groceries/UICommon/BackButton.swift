//
//  BackButton.swift
//  Groceries
//
//  Created by MacBook on 5/3/24.
//

import SwiftUI

struct BackButton: View {
   
    var didTap : (()->())?
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    didTap?()
                }label: {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                
                Spacer()
            }
            Spacer()
        }
        .padding(.top, .topInsets)
        .padding(.horizontal, 20)
    }
}

#Preview {
    BackButton()
}
