//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard cansSava else {
            return
        }
        //get currient user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        // Crete  model
            let newid = UUID().uuidString
            let newItem = ToDoListItem(
            id: newid,
            title: title,
            duedate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
            )
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todo")
            .document(newid)
            .setData(newItem.asDictionaly())
        
    }
    var cansSava: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
