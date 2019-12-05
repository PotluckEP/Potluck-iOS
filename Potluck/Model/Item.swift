//
//  item.swift
//  Potluck
//
//  Created by Daniel Morales on 10/29/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

class Item: NSObject{
    var id: String!
    var name: String!
    var person: String!
    var image: String!
    var details: String!
    var owner: String!
    var type: String!
    var path: String!
    
    init(id: String!, name: String!, person: String!, image: String!, details: String!, owner: String!, type: String!, path: String!){
        self.id = id
        self.name = name
        self.person = person
        self.image = image
        self.details = details
        self.owner = owner
        self.type = type
        self.path = path
    }
}

