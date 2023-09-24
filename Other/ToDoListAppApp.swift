//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
