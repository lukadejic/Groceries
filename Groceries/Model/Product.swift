
import Foundation

struct Product: Decodable , Identifiable, Encodable{
    let id: Int
    let title: String
    let description : String
    let price: Int
    let discountPercentage : Double
    let rating: Double
    let stock: Double
    let brand: String
    let category : String
    let thumbnail : String
    let images: [String]
}

struct ProductResponse : Decodable{
    let products : [Product]
}

struct MockData {
    static let sampleProduct = Product(id: 1, title: "Iphone 10", description: "phone", price: 241, discountPercentage: 41.21, rating: 2.14, stock: 281, brand: "Apple", category: "Smarthphone", thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3f-xob5X9DK81UkmQ9g7dNau2Pli7_kJ0Z07eG-yN7Q&s.jpg", images: ["dada"])
}
