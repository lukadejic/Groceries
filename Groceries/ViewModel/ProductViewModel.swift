import Foundation
import Swift


class ProductViewModel : ObservableObject {

    
    @Published var products : [Product] = []
    @Published var isShowingDetail = false
    @Published var selectedProduct : Product?
    @Published var rating = 0
    
    func getProducts(){
    
        Task{
            do{
               let fetchProducts = try await NetworkManager.shared.fetchProducts()
                DispatchQueue.main.async{
                    self.products = fetchProducts
                }
            }catch{
                throw JSONError.invalidData
            }
        }
        
    }
    
}
