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
    
    let transition = SlideInTransition()
    let user = "f0dsfjdf0sd"
    var events = [Event]()
    var ref: DatabaseReference!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func tapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // adding event to table
        //ref.child("users/f0dsfjdf0sd/events").observe(.childAdded) { (snapshot) in
            self.fetchEvent()
        //}
    }
    
    func fetchEvent(){
        
        // Getting the events from the user
        ref.child("users/f0dsfjdf0sd/events").observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "EventViewCell") as! EventViewCell
        
        cell.nameTextView.text = self.events[indexPath.row].name
        //cell.dateTextView.text = self.events[indexPath.row].date
       // cell.locationTextView.text = self.events[indexPath.row].location
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is PlanningViewController{
            let cell = sender as! UITableViewCell
            let indexPath = tableview.indexPath(for: cell)!
            let event = events[indexPath.row]

            let planningViewController = segue.destination as! PlanningViewController

            planningViewController.event = event

            tableview.deselectRow(at: indexPath, animated: true)
        }
    
    }
}


extension ViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
