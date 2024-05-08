//
//  FirebaseTestViewModel.swift
//  Markets
//
//  Created by Andy on 5/4/24.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class FirebaseSingleValueViewModel: ObservableObject {
    
    var ref = Database.database().reference()
    
    @Published var value: String? = nil
    @Published var object: ObjectData? = nil
    @Published var listObject = [ObjectData]()
    
    // reading value from Firebase Realtime Database
    func readValue() {
        ref.child("전통시장정보데이터/0/시장명").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String
        }
    }
    
    // Observe data being change in Firebase Realtime Database
    func observerDataChange() {
        ref.child("전통시장정보데이터/0/시장명").observe(.value) { snapshot in
            self.value = snapshot.value as? String ?? "Load failed"
        }
    }
    
    // Reading object from Firebase Realtime Database
    func readObject() {
        ref.child("전통시장정보데이터/0")
            .observe(.value) { snapshot in
                do {
                    self.object = try snapshot.data(as: ObjectData.self)
                } catch {
                    print("Can not convert to ObjectData")
                }
            }
    }
    
    // Get list of data
    func observeListObject() {
        ref.observe(.value) { parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            self.listObject = children.compactMap({ snapshot in
                return try? snapshot.data(as: ObjectData.self)
            })
        }
    }
}
