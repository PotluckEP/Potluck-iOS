//
//  SignInViewController.swift
//  Potluck
//
//  Created by Joshua Saavedra on 10/28/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Google Sign In stuff
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        let gSignIn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 230, height: 48))
        gSignIn.center = view.center
        view.addSubview(gSignIn)
        
    }
    
//    @IBAction func didTapSignOut(_ sender: AnyObject) {
//      GIDSignIn.sharedInstance().signOut()
//    }
}
