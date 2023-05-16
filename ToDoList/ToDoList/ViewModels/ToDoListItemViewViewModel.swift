//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Thomas D on 5/12/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

//VieModel for a single to do list item (each row in items list)

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
