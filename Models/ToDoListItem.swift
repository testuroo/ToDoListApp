//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

import Foundation
struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let duedate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone( _ state: Bool) {
        isDone = state
    }
}
