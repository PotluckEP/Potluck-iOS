//
//  AccountViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 12/9/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    var ref: DatabaseReference!
    let user = "f0dsfjdf0sd"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        fetchInfo()
    }
    
    func fetchInfo() {
        
        ref.child("users").child(user).observeSingleEvent(of: .value) { (snapshot) in
            
            print(snapshot)
            let userInfo = snapshot.value as! [String: Any]
            
            self.nameTextField.text = userInfo["name"] as! String
            self.emailTextField.text = userInfo["email"] as! String
            
            self.profileImage.image = UIImage(named: userInfo["img"] as! String)
            self.profileImage.layer.borderWidth = 1
            self.profileImage.layer.masksToBounds = false
            self.profileImage.layer.borderColor = UIColor.black.cgColor
            self.profileImage.clipsToBounds = true
        }
    }

    @IBAction func updateButtonClicked(_ sender: Any) {
        
        ref.child("users").child(user).observeSingleEvent(of: .value) { (snapshot) in
            
            print(snapshot)
            var userInfo = snapshot.value as! [String: Any]
            
            userInfo["name"] = self.nameTextField.text as! String
            userInfo["email"] = self.emailTextField.text as! String
            
            self.ref.child("users").child(self.user).setValue(userInfo)
        }
        
    }
    
    // Hide the keyboard if users touches out side the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    // Hide the keyboard if users press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
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
