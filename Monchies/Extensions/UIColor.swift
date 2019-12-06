//
//  UIColor.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/5/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    let redValue = CGFloat(red) / 255.0
    let greenValue = CGFloat(green) / 255.0
    let blueValue = CGFloat(blue) / 255.0
    self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
  }
}
