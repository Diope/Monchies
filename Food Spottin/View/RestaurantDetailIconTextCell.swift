//
//  RestaurantDetailIconTextCell.swift
//  Food Spottin
//
//  Created by Dion Pettaway on 12/5/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantDetailIconTextCell: UITableViewCell {
  
  @IBOutlet var iconImageView: UIImageView!
  @IBOutlet var shortTextLabel: UILabel! {
    didSet {
      shortTextLabel.numberOfLines = 0
    }
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
