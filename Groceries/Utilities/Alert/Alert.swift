
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title :Text
    let message:Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData       =      AlertItem(title: Text("Server error")
                                                  ,message: Text("The data recieved from the server was invalid.Please contact support."),
                                                  dismissButton: .default(Text("OK")))
    
    static let invalidResponse   =      AlertItem(title: Text("Server error")
                                                  ,message: Text("Invalid response from the server"),
                                                  dismissButton: .default(Text("OK")))
    
    static let invalidURL        =      AlertItem(title: Text("Server error")
                                                  ,message: Text("There was an issue connecting to the server"),
                                                  dismissButton: .default(Text("OK")))
    
    static let unableToComplete  =      AlertItem(title: Text("Server error")
                                                  ,message: Text("Please check internet connection."),
                                                  dismissButton: .default(Text("OK")))
}
