//
//  EventViewCell.swift
//  Potluck
//
//  Created by Daniel Morales on 10/24/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import MapKit

class EventViewCell: UITableViewCell {
    @IBOutlet weak var nameTextView: UILabel!
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var locationTextView: UILabel!
    @IBOutlet weak var detailsTextView: UILabel!
    @IBOutlet weak var directionsButton: UIButton!
    @IBOutlet weak var planButton: UIButton!
    @IBOutlet weak var map: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        directionsButton.layer.cornerRadius = 10
        planButton.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
