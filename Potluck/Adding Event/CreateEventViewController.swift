//
//  AddEventViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/19/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateEventViewController: UIViewController, UITextFieldDelegate {
    
    var ref: DatabaseReference!
    var list:List!

    @IBOutlet weak var eventNameTextView: UITextField!
    @IBOutlet weak var locationTextView: UITextField!
    @IBOutlet weak var descriptionTextView: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var startPlanningButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        startPlanningButton.layer.cornerRadius = 10
    }
    
    @IBAction func StartPlanningButtonClicked(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        let dateTxt = dateFormatter.string(from: dateTimePicker.date);
        self.view.endEditing(true)
        
        let planning = ["charge": "f0dsfjdf0sd", "name": "Creator"]
        let values = ["name": eventNameTextView.text,
                      "location": locationTextView.text,
                      "date": dateTxt,
                      "info" : descriptionTextView.text,
                      "owner" : "f0dsfjdf0sd",
                      "planning" : planning ] as [String : Any]
        
        let reference = ref.child("events").childByAutoId()
        let eventId = reference.key
        reference.setValue(values)
        
        self.ref.child("users/f0dsfjdf0sd/events").observeSingleEvent(of: .value, with: { (snapshot) in
            
            var eventsList = snapshot.value as! [String: String]
            eventsList[eventId!] = "owner"
            
            self.ref.child("users/f0dsfjdf0sd/events").updateChildValues(eventsList)
            
        })
        
        self.list = List(id: eventId, name: eventNameTextView.text as! String, charge: "f0dsfjdf0sd",
                         details: descriptionTextView.text as! String, owner: "f0dsfjdf0sd",
            path: "events/" + eventId! + "/planning");
    }

    // Hide the keyboard if users touches out side the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    // Hide the keyboard if users press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eventNameTextView.resignFirstResponder()
        locationTextView.resignFirstResponder()
        descriptionTextView.resignFirstResponder()
        return true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is PlanningViewController{
            
            let planningViewController = segue.destination as! PlanningViewController
            planningViewController.list = list
        }
        
    }
}
