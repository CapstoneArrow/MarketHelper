//
//  FirebaseTestViewModel.swift
//  Markets
//
//  Created by Andy on 5/4/24.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class FirebaseTestViewModel: ObservableObject {
    
    var ref = Database.database().reference()
    
    @Published var value: String? = nil
    
    func readValue() {
        ref.child("전통시장정보데이터/0/시장명").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String
        }
    }
}
