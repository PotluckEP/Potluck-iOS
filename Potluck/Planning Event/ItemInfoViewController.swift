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
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        fetchItems()
    }
    
    func fetchItems() {
        
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
