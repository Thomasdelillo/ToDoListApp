//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Thomas D on 5/12/23.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
