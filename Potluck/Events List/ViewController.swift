//
//  ViewController.swift
//  Potluck
//
//  Created by Jessica Rios on 10/18/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    let user = "f0dsfjdf0sd"
    var events = [Event]()
    var selectedIndex = -1
    var isCollapce = false
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.backgroundView = UIImageView(image: UIImage(named: "backgroundImage"))
        
        ref = Database.database().reference()
        
        let user = Auth.auth().currentUser?.uid as! String
        
        print("Current User:", user)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchEvent()
        
    }
    func fetchEvent(){
        
        // Getting the events from the user
        ref.child("users/f0dsfjdf0sd/events").observeSingleEvent(of: .value, with: { (snapshot) in
            
            self.events = []
            let eventsId = snapshot.value as! [String: String]
            
            for (id, rank) in eventsId { // Getting the events information
                
                self.ref.child("events").child(id).observeSingleEvent(of: .value, with: { (info) in

                    let event = info.value as! [String: Any]
                    
                    self.events.append( Event(id: id, name: event["name"] as! String, location: event["location"] as! String, date: event["date"] as! String, info: event["info"] as! String, owner: event["owner"] as! String, rank: rank, path: "events/" + id + "/planning"));
                    
                    self.tableview.reloadData();

                    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapce == true{
            return 424
        }else{
            return 75
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if selectedIndex == indexPath.row{
            if self.isCollapce == false {
                self.isCollapce = true
            }else{
                self.isCollapce = false
            }
        }
        else{
            self.isCollapce = true
        }
        
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "EventViewCell") as! EventViewCell
        
        cell.nameTextView.text = self.events[indexPath.row].name
        cell.dateTextView.text = "Date: " + self.events[indexPath.row].date
        cell.locationTextView.text = "Location: " + self.events[indexPath.row].location
    
        let location = "108 6th "
        //cell.map =
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is PlanningViewController{
            let event = events[selectedIndex]

            let planningViewController = segue.destination as! PlanningViewController

            let list = List(id: event.id, name: event.name, charge: event.owner, details: event.info, owner: event.owner, path: event.path)
            planningViewController.list = list
        }
    }
}
