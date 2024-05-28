//
//  LogInView.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI

struct LogInView: View {
    @StateObject var loginVM = LogInViewModel()
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
                
                
                VStack{
                    
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    
                    Text("Loging")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Enter your emails and password")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField( title: "Email", placholder: "Enter your email address", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField( title: "Password", placholder: "Enter your password", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryText)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, .screenWidth * 0.03)
                    
                    RoundButton(title: "Log In") {
                        Task{
                            try await viewModel.signIn(withEmail: loginVM.txtEmail , password: loginVM.txtPassword)
                        }
                    }
                    .disabled(!isFormValid)
                    .opacity(isFormValid ? 1.0 : 0.5)
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        HStack{
                            Text("Don’t have an account?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryText)
                            
                            Text("Signup")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryApp)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
                
            }
            .background(Color.white)
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        
    }
}

extension LogInView : AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !loginVM.txtEmail.isEmpty
        && loginVM.txtEmail.contains("@")
        && !loginVM.txtPassword.isEmpty
        && loginVM.txtPassword.count > 5
    }
}

#Preview {
    LogInView()
}
