//
//  EventViewCell.swift
//  Potluck
//
//  Created by Daniel Morales on 10/24/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import MapKit
import Contacts


class EventViewCell: UITableViewCell {
    @IBOutlet weak var nameTextView: UILabel!
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var locationTextView: UILabel!
    @IBOutlet weak var detailsTextView: UILabel!
    @IBOutlet weak var directionsButton: UIButton!
    @IBOutlet weak var planButton: UIButton!
    @IBOutlet weak var map: MKMapView!
    
   
    @IBAction func openAppleMaps(_ sender: Any) {
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 36.6533888889 , longitude: -121.796416667)))
        source.name = "Source"

        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 36.322597, longitude: -121.240223)))
        destination.name = "Destination"

        MKMapItem.openMaps(with: [source, destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            
            directionsButton.layer.cornerRadius = 10
            planButton.layer.cornerRadius = 10
        }
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
          map.setRegion(coordinateRegion, animated: true)
        }
        func addPin() {
            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: 36.322597, longitude:-121.240223)
            annotation.coordinate = centerCoordinate
            annotation.title = "Location"
            map.addAnnotation(annotation)
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // set initial location in Honolulu
            let initialLocation = CLLocation(latitude: 36.322597, longitude: -121.240223)
     
            centerMapOnLocation(location: initialLocation)
            addPin()

            // Configure the view for the selected state
        }

    }
