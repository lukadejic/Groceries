//
//  SearchTextField.swift
//  Groceries
//
//  Created by MacBook on 4/24/24.
//

import SwiftUI

struct SearchTextField: View {
    
    @State var placholder: String = "Placholder"
    @Binding var txt: String

    var body: some View {
        HStack(spacing: 15) {
            
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            TextField(placholder, text: $txt)
                .font(.customfont(.regular, fontSize: 16))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
            
        }
        .frame(height: 30)
        .padding(15)
        .background(Color(hex: "F2F2F2"))
        .cornerRadius(16)
        .padding(15)
    }
}

#Preview {
    SearchTextField( placholder: "Search Store", txt: .constant(""))
}
