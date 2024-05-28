//
//  RatingViewModel.swift
//  Groceries
//
//  Created by MacBook on 5/13/24.
//

import Foundation
import SwiftUI

class RatingViewModel : ObservableObject{
    @State var rating: Int = 1
    @Published var label = ""
    @Published var maximumRating = 5
    
    @Published var offImage : Image?
    @Published var onImage = Image(systemName: "star.fill")
    
    @Published var offColor = Color.gray
    @Published var onColor = Color.yellow

    
    func image(for number: Int) -> Image{
        if number > rating{
            offImage ?? onImage
        }else{
            onImage
        }
    }
    
}
