
import Foundation
import SwiftUI

final class FavouriteViewModel : ObservableObject{
    
    @Published var favItems : [Product] = []
    @EnvironmentObject var favouriteVM : FavouriteViewModel
    @StateObject var detailVM = ProductDetailViewModel()
    
    func add(_ product: Product){
        favItems.append(product)
        UserDefaults.standard.set(true, forKey: "\(UserDefaults.favoriteKey)_\(product.id)")
        saveFavItems()
    }
   
    func removeProduct(_ productToRemove: Product, from products: inout [Product]) {
        products.removeAll { $0.id == productToRemove.id }
        saveFavItems()
    }
    
    func deleteItems(at offsets: IndexSet) {
        favItems.remove(atOffsets: offsets)
        self.favItems = favItems
        saveFavItems()
    }
    
    
    func saveFavItems(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favItems){
            UserDefaults.standard.set(encoded, forKey: UserDefaults.favoriteKey)
        }
    }
    
    func loadFavItems() {
        
        if let data = UserDefaults.standard.data(forKey: UserDefaults.favoriteKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Product].self, from: data) {
                favItems = decoded
            }
        }
    }
    
    func toggleFavorite(for product: Product) {
        
    }
    
    

}
