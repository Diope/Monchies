//
//  RestaurantDetailTextCell.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/5/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {
  
  @IBOutlet var descriptionLabel: UILabel! {
    didSet {
      descriptionLabel.numberOfLines = 0
    }
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//      self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
