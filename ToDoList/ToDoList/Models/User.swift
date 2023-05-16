//
//  User.swift
//  ToDoList
//
//  Created by Thomas D on 5/12/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
