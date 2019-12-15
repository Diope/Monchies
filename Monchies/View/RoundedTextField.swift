//
//  RoundedTextField.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/12/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {

  let padding = UIEdgeInsets(top:0, left: 10, bottom: 0, right: 10)
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.layer.cornerRadius = 4.0
    self.layer.masksToBounds = true
    self.layer.backgroundColor = UIColor.systemGray4.cgColor
  }

}
