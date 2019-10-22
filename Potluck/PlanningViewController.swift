//
//  PlanningViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/22/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

class PlanningViewController: UIViewController {

    var event: Event!
    @IBOutlet weak var viewTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTitle.text = event.name
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
