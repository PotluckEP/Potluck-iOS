//
//  MenuViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/19/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case profile
    case events
    case logOut
}

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("Dismissing: \(menuType)")
        }
    }

}
