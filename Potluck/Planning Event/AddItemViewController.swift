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
                        "charge": chargeTextField.text,
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
