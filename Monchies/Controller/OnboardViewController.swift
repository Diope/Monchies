//
//  OnboardViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/15/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class OnboardViewController: UIViewController, OnboardPageViewControllerDelegate {
  
  func didUpdatePageIndex(currentIndex: Int) {
    updateUI()
  }
  
  
  var onboardPageViewController: OnboardPageViewController?
  
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var nextButton: UIButton! {
    didSet {
      nextButton.layer.cornerRadius = 25.0
      nextButton.layer.masksToBounds = true
    }
  }
  @IBOutlet weak var skipButton: UIButton!
  @IBAction func skipButtonTapped(sender: UIButton) {
    UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
    dismiss(animated: true, completion: nil)
}
  
  @IBAction func nextButtonTapped(sender: UIButton) {
    if let index = onboardPageViewController?.currentIndex {
        switch index {
        case 0...1:
          onboardPageViewController?.forwardPage()
        
        case 2:
          UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
          dismiss(animated: true, completion: nil)
          
        default: break
      }
    }
      updateUI()
  }

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination
    if let pageViewController = destination as? OnboardPageViewController {
      onboardPageViewController = pageViewController
      onboardPageViewController?.onboardDelegate = self
    }
  }
  
  func updateUI() {
    if let index = onboardPageViewController?.currentIndex {
      switch index {
      case 0...1:
        nextButton.setTitle("NEXT", for: .normal)
        skipButton.isHidden = false
        
      case 2:
        nextButton.setTitle("GET STARTED", for: .normal)
        skipButton.isHidden = true
        
      default: break
      }
      pageControl.currentPage = index
    }
  }
  

}
