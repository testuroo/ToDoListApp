//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var ViewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
