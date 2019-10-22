//
//  EventTableViewCell.swift
//  
//
//  Created by Daniel Morales on 10/22/19.
//

import UIKit

class EventTableViewCell: UITableViewCell {

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
