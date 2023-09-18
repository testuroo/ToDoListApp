//
//  MainViewVIewModel.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//
import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSigneIn: Bool {
        
        return  Auth.auth().currentUser != nil
    }
}