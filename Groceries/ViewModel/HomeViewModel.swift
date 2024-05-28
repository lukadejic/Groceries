
import Foundation
import SwiftUI

struct Tab : Identifiable {
    let id = UUID()
    let title : String
    let icon : String
    let index : Int
}

struct SectionTitle : Identifiable{
    let id = UUID()
    let title : String
    let titleAll : String
}

class HomeViewModel : ObservableObject {
    
    static var shared : HomeViewModel = HomeViewModel()
    
    @Published var selectedTab : Int = 0
    @Published var txtSearch : String = ""
    
    
    @Published var tabs: [Tab] = [
            Tab(title: "Shop", icon: "store_tab", index: 0),
            Tab(title: "Explore", icon: "explore_tab", index: 1),
            Tab(title: "Cart", icon: "cart_tab", index: 2),
            Tab(title: "Favorites", icon: "fav_tab", index: 3),
            Tab(title: "Account", icon: "account_tab", index: 4)
    ]
    
    @Published var sectionTitle : [SectionTitle] = [
        SectionTitle(title: "Popular", titleAll: "See All"),
        SectionTitle(title: "Exclusive Offer", titleAll: "See All"),
        SectionTitle(title: "Best Selling", titleAll: "See All"),
    ]
    
    
}
