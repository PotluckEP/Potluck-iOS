//
//  PlanningViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/22/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PlanningViewController: UIViewController {

    var event: Event!
    var ref: DatabaseReference!
    
    @IBOutlet weak var itemTextView: UILabel!
    @IBOutlet weak var personInChangeImg: UIImageView!
    @IBOutlet weak var personInChargeTextView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        fetchPlanning();
    }
    
    func fetchPlanning(){
        
        self.ref.child(event.path).observeSingleEvent(of: .value) { (snapshot) in
            
            let items = snapshot.value as! [String: Any]
            self.itemTextView.text = items["name"] as! String
        }
        
        self.ref.child("users").child(event.owner).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let user = snapshot.value as! [String: Any]
            self.personInChargeTextView.text = user["name"] as! String
        })
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
