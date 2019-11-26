//
//  AddCodeEvent.swift
//  Potluck
//
//  Created by Daniel Morales on 11/25/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import Firebase

class AddCodeEventViewController: UIViewController{
    
    var ref: DatabaseReference!
    var list:List!
    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    }
   
    @IBAction func AddEventClicked(_ sender: Any) {
        
        var code = codeTextField.text!
        
        self.ref.child("events").child(code).observeSingleEvent(of: .value) { (snapshot) in
                   
            let eventsList = snapshot.value as! [String: Any]

            self.list = List(id: code, name: eventsList["name"] as! String, charge: eventsList["owner"] as! String,
                        details: eventsList["info"] as! String, owner: eventsList["owner"] as! String,
            path: "events/" + code + "/planning");


        }
        
        self.ref.child("users/f0dsfjdf0sd/events").observeSingleEvent(of: .value) { (snapshot) in
            var eventsList = snapshot.value as! [String: String]
            eventsList[code] = "member"
            
            self.ref.child("users/f0dsfjdf0sd/events").setValue(eventsList)
            
        }
        
        
    }
    
    // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.destination is PlanningViewController{
                   
            let planningViewController = segue.destination as! PlanningViewController
            planningViewController.list = list
            
            print(list)
            
        }
    }

}

