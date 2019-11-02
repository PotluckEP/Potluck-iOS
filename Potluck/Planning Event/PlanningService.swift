//
//  PlanningService.swift
//  Potluck
//
//  Created by Daniel Morales on 10/31/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PlanningService: NSObject{
    
    var ref: DatabaseReference!
    
    override init() {
        ref = Database.database().reference()
    }
    
    func getUserName(id: String) -> String {
        
        var name: String!
        
        self.ref.child("users").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            let user = snapshot.value as! [String: Any]
            name = user["name"] as! String
        })

        return name;
    }
}
