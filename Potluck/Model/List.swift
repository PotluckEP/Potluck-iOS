//
//  List.swift
//  Potluck
//
//  Created by Daniel Morales on 11/1/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

class List: NSObject{
    var id: String!
    var name: String!
    var charge: String!
    var details: String!
    var path: String!
    
    init(id: String!, name: String!, charge: String!, details: String!, owner: String!, path: String!){
        self.id = id
        self.name = name
        self.charge = charge
        self.details = details
        self.path = path
    }
}

