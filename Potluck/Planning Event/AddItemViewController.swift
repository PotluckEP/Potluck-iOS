//
//  AddItemViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 11/3/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import Firebase

class AddItemViewController: UIViewController {
    
    var path: String!
    var ref: DatabaseReference!
    var nameList: [String: String] = ["Jessica": "wepourpowqeu", "Daniel": "f0dsfjdf0sd", "Josh": "p2Quzpx1azansI4GhNEr8ZuRGhi1"]

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var chargeTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var option: UISegmentedControl!
    @IBOutlet weak var addItemButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        addItemButton.layer.cornerRadius = 10
    }
    
    @IBAction func AddItemButtonClicked(_ sender: Any) {
        
        let type = option.titleForSegment(at: option.selectedSegmentIndex) as! String
        
        var newItem = [ "name": titleTextField.text,
                        "charge": nameList[chargeTextField.text as! String],
                        "description": descriptionTextField.text
        ]
        
        if(type == "Item"){
            newItem["type"] = "Item"
            newItem["bringing"] = "f0dsfjdf0sd"
        }else{
            newItem["type"] = "List"
        }
        
        self.ref.child(path).childByAutoId().setValue(newItem);
        
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    // Hide the keyboard if users touches out side the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    // Hide the keyboard if users press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        chargeTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        return true;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
