//
//  ReviewViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/10/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet var rateButtons: [UIButton]!
  @IBOutlet var closeButton: UIButton!
  @IBAction func close() {
    dismiss(animated: true, completion: {
      self.closeButton.alpha = 0
    })
  }
  
  var restaurant: RestaurantMO!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      // Do any additional setup after loading the view.
      if let restaurantImage = restaurant.image {
        backgroundImageView.image = UIImage(data: restaurantImage as Data)
      }
      let blurFX = UIBlurEffect(style: .dark)
      let blurFXView = UIVisualEffectView(effect: blurFX)
      blurFXView.frame = view.bounds
      backgroundImageView.addSubview(blurFXView)
      
      let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
      
      for button in rateButtons {
        button.transform = moveRightTransform
        button.alpha = 0
      }
    }
  
    
  override func viewWillAppear(_ animated: Bool) {
    
  
//    for rateButton in rateButtons {
//      UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.3, animations: {
//        rateButton.alpha = 0.75
//        rateButton.transform = .identity
//      }, completion: nil)
//    }
    
    
    UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.3, options: [], animations: {
      self.rateButtons[0].alpha = 0.75
      self.rateButtons[0].transform = .identity
    }, completion: nil)
    
    UIView.animate(withDuration: 1.5, delay: 0.15, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.3, options: [], animations: {
      self.rateButtons[1].alpha = 0.75
      self.rateButtons[1].transform = .identity
    }, completion: nil)
    
    UIView.animate(withDuration: 1.5, delay: 0.2, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.3, options: [], animations: {
      self.rateButtons[2].alpha = 0.75
      self.rateButtons[2].transform = .identity
    }, completion: nil)
    
    UIView.animate(withDuration: 1.5, delay: 0.25, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.3, options: [], animations: {
      self.rateButtons[3].alpha = 0.75
      self.rateButtons[3].transform = .identity
    }, completion: nil)
    
    UIView.animate(withDuration: 1.5, delay: 0.30, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.3, options: [], animations: {
      self.rateButtons[4].alpha = 0.75
      self.rateButtons[4].transform = .identity
    }, completion: nil)
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
