//
//  TabButton.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI

struct TabButton: View {
    
    @State var title : String = "Title"
    @State var icon : String = "store_tab"
    var isSelected : Bool = false
    var didSelect : (() -> ())?
    
    var body: some View {
        Button{
            debugPrint("Tab Button Tap")
            didSelect?()
        }label: {
            VStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                
            }
        }
        .foregroundStyle(isSelected ? .primary : .secondary)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    TabButton()
}
