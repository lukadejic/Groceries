
import Foundation
import SwiftUI

struct nutRow : Identifiable{
    let id = UUID()
    let name: String
    let nutriton : Int
}

class ProductDetailViewModel : ObservableObject{
    
    @Published var isFav : Bool = false
    @Published var isShowingDescription : Bool = false
    @Published var isShowingProductDetails: Bool = false
    @Published var qty : Int = 1
    
    func addSubQTY(isAdd : Bool = true) {
        if(isAdd){
            qty += 1
            if(qty > 99){
                qty = 99
            }
        }else{
            qty -= 1
            if(qty < 1){
                qty = 1
            }
        }
    }

    func formattedDetails(for product: Product) -> String {
            return """
            Calories: \(product.stock)
            Proteins: \(product.stock)
            Carbs: \(product.stock)
            """
    }
    
    
    func checkFavoriteStatus(for product: Product) {
           if UserDefaults.standard.bool(forKey: "\(UserDefaults.favoriteKey)_\(product.id)") {
               isFav = true
           }
    }
  
}

extension UserDefaults {
    static let favoriteKey = "favoriteProducts"
}
