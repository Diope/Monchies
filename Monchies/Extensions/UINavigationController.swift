//
//  UINavigationController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/5/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

extension UINavigationController {
  open override var childForStatusBarStyle: UIViewController? {
    return topViewController
  }
}
