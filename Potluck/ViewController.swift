//
//  ViewController.swift
//  Potluck
//
//  Created by Jessica Rios on 10/18/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var tableview: UITableView!
    
    let user = "f0dsfjdf0sd"
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // adding event to table
        
        ref.child("users/f0dsfjdf0sd/events").observe(.childAdded) { (snapshot) in
            self.fetchEvent()
        }
    }
    
    func fetchEvent(){
        
        // Getting the events from the user
        ref.child("users/f0dsfjdf0sd/events").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let eventsId = snapshot.value as! [String: String]
            
            for (id, rank) in eventsId { // Getting the events information
                
                print(id)
                self.ref.child("events").child(id).observeSingleEvent(of: .value, with: { (info) in
                    
                    let event = info.value as! [String: String]
                    
                    self.events.append( Event(name: event["name"], location: event["location"], date: event["date"], info: event["info"], owner: event["owner"], rank: rank));
                    
                    self.tableview.reloadData();
                    
                    print(self.events)
                    
                }) { (error) in
                    print(error)
                }
            }
            
        }) { (error) in
            print(error)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(self.events.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellEvent = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellEvent")
        cellEvent.textLabel?.text = self.events[indexPath.row].name
        return cellEvent
    }
}
