//
//  InfoListViewController.swift
//  Potluck
//
//  Created by Jessica Rios on 12/5/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import MessageUI

class InfoListViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    //@IBOutlet weak var TitleTextView: AkiraTextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let message = MFMessageComposeViewController()
        
        message.body = "daniel"
        message.recipients = ["daniel"]
        message.messageComposeDelegate = self
        
        if MFMessageComposeViewController.canSendText() {
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
