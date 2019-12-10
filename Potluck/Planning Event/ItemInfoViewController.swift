//
//  ItemInfoViewController.swift
//  Potluck
//
//  Created by Jessica Rios on 12/7/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import Firebase

class ItemInfoViewController: UIViewController {

    var ref: DatabaseReference!
    var path: String = "events"
    
    @IBOutlet weak var chargeTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        fetchItems()
    }
    
    func fetchItems() {
        
        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
            
            let item = snapshot.value as! [String: String]
            
            self.itemTextField.text = item["name"]
            self.descriptionTextField.text = item["description"]
            
            self.ref.child("users").child(item["charge"]!).observeSingleEvent(of: .value) { (snapshot2) in
                
                let user = snapshot2.value as! [String: Any]
                self.chargeTextField.text = user["name"] as! String
                
                self.profileImage.image =  UIImage(named: user["img"] as! String)
                self.profileImage.layer.borderWidth = 1
                self.profileImage.layer.masksToBounds = false
                self.profileImage.layer.borderColor = UIColor.black.cgColor
                self.profileImage.layer.cornerRadius = self.profileImage.frame.height/2
                self.profileImage.clipsToBounds = true
            }
        }
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
//        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
//
//            print(snapshot)
//            var itemInfo = snapshot.value as! [String: String]
//
//            itemInfo["name"] = self.nameTextField.text as! String
//            itemInfo["email"] = self.emailTextField.text as! String
//
//            self.ref.child("users").child(self.user).setValue(userInfo)
//        }
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    // Hide the keyboard if users press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chargeTextField.resignFirstResponder()
        itemTextField.resignFirstResponder()
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
