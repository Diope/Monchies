//
//  OnboardViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/15/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class OnboardViewController: UIViewController {
  
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var nextButton: UIButton! {
    didSet {
      nextButton.layer.cornerRadius = 25.0
      nextButton.layer.masksToBounds = true
    }
  }
  @IBOutlet weak var skipButton: UIButton!

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }
  

}
