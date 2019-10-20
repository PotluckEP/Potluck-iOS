//
//  EventClass.swift
//  Potluck
//
//  Created by Daniel Morales on 10/20/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

class Event: NSObject{
    var name: String?
    var location: String?
    var date: String?
    var descriptio: String?
    var rank: String?
    
    init(name: String?, location: String?, date: String?, descriptio: String?, rank: String?){
        self.name = name;
        self.location = location;
        self.date = date;
        self.descriptio = descriptio;
        self.rank = rank;
    }
    
}
