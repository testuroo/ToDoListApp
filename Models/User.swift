//
//  User.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

import Foundation
struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined:TimeInterval
}
