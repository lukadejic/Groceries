
import Foundation

class RegistrationViewModel : ObservableObject {
    
    @Published var txtFullName: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var txtForgotPassword : String = ""
    @Published var isShowPassword: Bool = false
    @Published var isShowForgotPassword: Bool = false
    
}

