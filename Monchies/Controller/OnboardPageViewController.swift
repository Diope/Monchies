//
//  OnboardPageViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/15/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class OnboardPageViewController: UIPageViewController, UIPageViewControllerDataSource {
  
  var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER AND SAVE GREAT RESTAURANTS"]
  var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
  var pageSubHeadings = ["Pin your favorite restaurants and create your own food guide", "Search and locate your favorite restaurant on Maps", "Find restaurants shared by your friends!"]
  var currentIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    
    if let startingViewController = contentViewController(at: 0) {
      setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
    }
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    var index = (viewController as! OnboardContentViewController).index
    index -= 1
    
    return contentViewController(at: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! OnboardContentViewController).index
    index += 1
    
    return contentViewController(at: index)
  }
  
  func contentViewController(at index: Int) -> OnboardContentViewController? {
    if index < 0 || index >= pageHeadings.count {
      return nil
    }
    
    let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
    if let pageContentViewController = storyboard.instantiateViewController(identifier: "OnboardContentViewController") as? OnboardContentViewController {
      pageContentViewController.imageFile = pageImages[index]
      pageContentViewController.heading = pageHeadings[index]
      pageContentViewController.subHeading = pageSubHeadings[index]
      pageContentViewController.index = index
      
      return pageContentViewController
    }
     return nil
  }
}
