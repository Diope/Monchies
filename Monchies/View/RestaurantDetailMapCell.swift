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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
