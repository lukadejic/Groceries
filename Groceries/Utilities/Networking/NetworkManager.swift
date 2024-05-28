import Foundation
import SwiftUI
class NetworkManager {
    
    static let shared = NetworkManager()
    let url = "https://dummyjson.com/products"
    private let cache = NSCache < NSString, UIImage >()
    
    func fetchProducts() async throws -> [Product] {
        
        guard let url = URL(string: url) else {
            throw JSONError.invalidURL
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw JSONError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(ProductResponse.self, from: data).products
        }catch{
            throw JSONError.invalidData
        }
        
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response,error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
}
