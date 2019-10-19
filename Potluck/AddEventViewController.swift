//
//  AddEventViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/19/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//


import UIKit
import FirebaseDatabase

class AddEventViewController: UIViewController, UITextFieldDelegate {
    
    var ref: DatabaseReference?

    @IBOutlet weak var eventNameTextView: UITextField!
    @IBOutlet weak var locationTextView: UITextField!
    @IBOutlet weak var descriptionTextView: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventNameTextView.delegate = self
        self.locationTextView.delegate = self
        self.descriptionTextView.delegate = self
        ref = Database.database().reference()
    }
    
    
    @IBAction func StartPlanningButtonClicked(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        let dateTxt = dateFormatter.string(from: dateTimePicker.date);
        self.view.endEditing(true)
        
        //ref?.child("events").childByAutoId().setValue(["eventName": eventNameTextView.text, dateTxt,: dateTxt, "location": locationTextView.text])
        let values = ["eventName": eventNameTextView.text, "date": dateTxt, "location": locationTextView.text]
        ref?.child("events").childByAutoId().setValue(values)
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
}
