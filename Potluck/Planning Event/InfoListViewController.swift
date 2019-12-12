//
//  InfoListViewController.swift
//  Potluck
//
//  Created by Jessica Rios on 12/5/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

class InfoListViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    var ref: DatabaseReference!
    var path: String!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var chargeTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        fetchInfo()
        // Do any additional setup after loading the view.
    }
    
    func fetchInfo(){
        
        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
            
            print(snapshot)
            let list  = snapshot.value as! [String: Any]
            
            
            //self.titleTextField.text = list["name"] as! String
            //self.descriptionTextField.text = list["description"] as! String
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch (result) {
               case .cancelled:
                   print("Message was cancelled")
                   dismiss(animated: true, completion: nil)
               case .failed:
                   print("Message failed")
                   dismiss(animated: true, completion: nil)
               case .sent:
                   print("Message was sent")
                   dismiss(animated: true, completion: nil)
               default:
               break
           }
        
    }

    @IBAction func sendInvite(_ sender: Any) {
        
        if MFMessageComposeViewController.canSendText() {
            let message = MFMessageComposeViewController()
                        
            message.body = "You are invited to participate on this event. Please add the event using the code: -LsTL5a0q8LnW4L4b8oV"
            
            message.messageComposeDelegate = self
            
            self.present(message, animated: true, completion: nil)
        }else{
            print("Can't send message")
        }
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
