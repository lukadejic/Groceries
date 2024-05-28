//
//  GroceriesApp.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI
import Firebase

@main
struct GroceriesApp: App {

    @StateObject var viewModel = AuthViewModel()
    @StateObject var favouriteVM = FavouriteViewModel()
    
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(favouriteVM)
        }
    }
}
