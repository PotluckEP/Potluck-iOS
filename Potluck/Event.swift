//
//  EventClass.swift
//  Potluck
//
//  Created by Daniel Morales on 10/20/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

class Event: NSObject{
    var id: String!
    var name: String!
    var location: String!
    var date: String!
    var info: String!
    var owner: String!
    var rank: String!
    var path: String!
    
    init(id: String!, name: String!, location: String!, date: String!, info: String!, owner: String!, rank: String!, path: String!){
        self.id = id
        self.name = name
        self.location = location
        self.date = date
        self.info = info
        self.owner = owner
        self.rank = rank
        self.path = path
    }
    
}
