//
//  RestaurantTableViewCell.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/2/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
  
  @IBOutlet var nameLabel: UILabel! {
    didSet {
      nameLabel.numberOfLines = 0
    }
  }
  @IBOutlet var locationLabel: UILabel! {
    didSet {
      locationLabel.numberOfLines = 1
    }
  }
  
  @IBOutlet var typeLabel: UILabel!
  @IBOutlet var thumbnailImageView: UIImageView! 
  
  @IBOutlet var heartImageView: UIImageView! {
    didSet {
      heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
      heartImageView.tintColor = #colorLiteral(red: 0.9240588546, green: 0.5975355506, blue: 0.6359851956, alpha: 1)
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
