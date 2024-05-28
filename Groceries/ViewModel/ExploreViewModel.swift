
import Foundation
import SwiftUI
struct Cell : Identifiable{
    let id = UUID()
    let imageName: String
    let cellName: String
    let color: Color
}

class ExploreViewModel : ObservableObject{
    
    @Published var txtSearch : String = ""
    
    @Published var cells : [Cell] = [
        Cell(imageName: "smartphones", cellName: "SmartPhones", color: Color.green),
        Cell(imageName: "laptops", cellName: "Laptops", color: Color.brown),
        Cell(imageName: "perfumes", cellName: "Perfumes", color: Color.pink),
        Cell(imageName: "hygiene", cellName: "Hygiene", color: Color.purple ),
        Cell(imageName: "groceries", cellName: "Groceries", color: Color.yellow),
        Cell(imageName: "decoration", cellName: "Home Decoration", color: Color.blue)
    ]
    
    
    
}
