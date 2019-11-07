//
//  File.swift
//  Potluck
//
//  Created by Daniel Morales on 11/3/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirebaseService: NSObject{
    
    private var ref: DatabaseReference!
    
    override init() {
        ref = Database.database().reference()
    }

    func getName(userId: String) -> String {
        
        var name: String!
        
        self.ref.child("users").child(userId).child("name").observeSingleEvent(of: .value) { (snapshot) in
            
            name = snapshot.value as? String
        }
        
        return name;
    }
}
