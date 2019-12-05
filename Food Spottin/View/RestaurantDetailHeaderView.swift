//
//  RestaurantDetailHeaderView.swift
//  Food Spottin
//
//  Created by Dion Pettaway on 12/4/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {
  
  @IBOutlet var headerImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel! {
    didSet {
      nameLabel.numberOfLines = 0
    }
  }
  
  @IBOutlet var typeLabel: UILabel! {
    didSet {
      typeLabel.layer.cornerRadius = 5.0
      typeLabel.layer.masksToBounds = true
    }
  }
  
  @IBOutlet var heartImageView: UIImageView! {
    didSet {
      heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
      heartImageView.tintColor = .white
    }
  }

}
