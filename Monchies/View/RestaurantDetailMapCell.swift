//
//  RestaurantDetailMapCell.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/6/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
  
  @IBOutlet var mapView: MKMapView!
  
  
  func configure(location: String) {
    let geoCoder = CLGeocoder()
    
    
    
    geoCoder.geocodeAddressString(location, completionHandler: {placemarks, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      if let placemarks = placemarks {
        let placemark = placemarks[0]
        let annotation = MKPointAnnotation()
        
        if let location = placemark.location {
          annotation.coordinate = location.coordinate
          self.mapView.addAnnotation(annotation)
          
          let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
          self.mapView.setRegion(region, animated: false)
        }
      }
    })
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
