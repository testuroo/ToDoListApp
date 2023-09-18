//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassege = ""
    
    init() {}
    
    func login() {
        guard validae() else  {
            return
        }
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validae() -> Bool {
        errorMassege = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMassege = "Please fill in all fields."
            return false
        }
        
        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMassege = "Please enter valid email."
            return false
        }
 
        return true
    }
}
