//
//  infoItemViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 11/26/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import Firebase

class infoItemViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
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

