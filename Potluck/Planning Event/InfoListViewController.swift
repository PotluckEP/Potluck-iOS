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
        
        print(path)
        
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
            
            message.body = "daniel"
            message.recipients = ["daniel"]
            message.messageComposeDelegate = self
            
            self.present(message, animated: true, completion: nil)
        }else{
            print("Can't send message")
        }
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
