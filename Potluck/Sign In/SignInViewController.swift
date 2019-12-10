//
//  SignInViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 11/6/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Google Sign In stuff
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    @IBAction func testButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    @IBAction func googleSignButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
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
