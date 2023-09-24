//
//  Extensions.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

import Foundation

extension Encodable {
    
    func asDictionaly() -> [String: Any] {
        guard let date = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do  {
            let  json = try JSONSerialization.jsonObject(with: date) as? [String: Any]
            return json ?? [:]
        } catch {
            return[:]
            
        }
    }
}
