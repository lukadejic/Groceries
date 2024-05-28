//
//  RegistrationView.swift
//  Groceries
//
//  Created by MacBook on 4/23/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var regVM = RegistrationViewModel()
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    var body: some View {
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
                
                
                Text("Sign up")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Create your account")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField( title: "Email", placholder: "Enter your email address", txt: $regVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineTextField( title: "Full Name", placholder: "Enter your full name", txt: $regVM.txtFullName)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineSecureField( title: "Password", placholder: "Enter your password", txt: $regVM.txtPassword, isShowPassword: $regVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                LineSecureField( title: "Confirm Password", placholder: "Enter your password", txt: $regVM.txtForgotPassword, isShowPassword: $regVM.isShowForgotPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton(title: "Sign up") {
                    Task{
                        try await viewModel.createUser(withEmail:regVM.txtEmail, password:regVM.txtPassword,fullname:regVM.txtFullName)
                    }
                }
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1.0 : 0.5)
                .padding(.bottom, .screenWidth * 0.05)
                
                HStack{
                    
                    Text("Already have an account?")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryText)
                    
                    NavigationLink {
                        LogInView()
                    } label: {
                        Text("Sign in")
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

extension RegistrationView : AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !regVM.txtEmail.isEmpty
        && regVM.txtEmail.contains("@")
        && !regVM.txtPassword.isEmpty
        && regVM.txtPassword.count > 5
        && regVM.txtForgotPassword == regVM.txtPassword
        && !regVM.txtFullName.isEmpty
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
