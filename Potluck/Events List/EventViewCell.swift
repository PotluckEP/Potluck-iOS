//
//  EventViewCell.swift
//  Potluck
//
//  Created by Daniel Morales on 10/24/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit

class EventViewCell: UITableViewCell {
    @IBOutlet weak var nameTextView: UILabel!
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var locationTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
