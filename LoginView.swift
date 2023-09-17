//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var  viewModel = LoginViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things Done",
                           angle: 15,
                           background: .pink)
                
                //Login Form
                Form{
                    if !viewModel.errorMassege.isEmpty {
                        Text(viewModel.errorMassege)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    TLButton(title: "Log in",
                             background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                
                
                
                //Create Account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
