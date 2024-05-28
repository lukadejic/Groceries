//
//  SectionTitleAll.swift
//  Groceries
//
//  Created by MacBook on 4/24/24.
//

import SwiftUI

struct SectionTitleAll : View{
    
    @State var title : String = "Title"
    @State var titleAll : String = "View all"
    
    var didTap : (()->())?
    var body: some View {
        
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryApp)
        }
        .padding(20)
        .frame(height: 40)
    }
    
    
}

#Preview {
    SectionTitleAll()
        .padding(20)
}
