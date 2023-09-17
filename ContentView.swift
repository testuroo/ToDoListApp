//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

import SwiftUI

struct MainView: View {
    @StateObject var  viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSigneIn, !viewModel.currentUserId.isEmpty {
            aaccontView
            //siged in

        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var aaccontView: some View {
    
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
