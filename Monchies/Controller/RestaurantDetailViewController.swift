//
//  RestaurantDetailViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/3/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var brandColor = UIColor(red: 0.004207400605, green: 0.8167108297, blue: 0.8440560699, alpha: 1)
  var restaurant: RestaurantMO!
  
//  @IBOutlet var restaurantImageView: UIImageView!
//  @IBOutlet var restaurantNameView: UILabel!
//  @IBOutlet var restaurantTypeView: UILabel!
//  @IBOutlet var restaurantLocationView: UILabel!
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var headerView: RestaurantDetailHeaderView!
  
  @IBAction func close(segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: {
      if let rating = segue.identifier {
        self.restaurant.rating = rating
        self.headerView.ratingImageView.image = UIImage(named: rating)
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
          appDelegate.saveContext()
        }
        
        let scaleTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.headerView.ratingImageView.transform = scaleTransform
        self.headerView.ratingImageView.alpha = 0
        
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: [] ,animations: {
          self.headerView.ratingImageView.transform = .identity
          self.headerView.ratingImageView.alpha = 1
        }, completion: nil)
      }
    })
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    if let rating = restaurant.rating {
      headerView.ratingImageView.image = UIImage(named: rating)
    }

    navigationItem.largeTitleDisplayMode = .never
    navigationController?.hidesBarsOnSwipe = false
    
    
    headerView.nameLabel.text = restaurant.name
    headerView.typeLabel.text = restaurant.type
    if let restaurantImage = restaurant.image {
      headerView.headerImageView.image = UIImage(data: restaurantImage as Data)
    }
    headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
    
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.tintColor = .white
    
    tableView.contentInsetAdjustmentBehavior = .never
    
      // Do any additional setup after loading the view.
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      navigationController?.hidesBarsOnSwipe = false
      navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
      cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.label, renderingMode: .alwaysOriginal)
      cell.shortTextLabel.text = restaurant.phone
      cell.selectionStyle = .none
      
      return cell
      
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
      cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.label, renderingMode: .alwaysOriginal)
      cell.shortTextLabel.text = restaurant.location
      cell.selectionStyle = .none
      
      return cell
      
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
      cell.descriptionLabel.text = restaurant.summary
      cell.selectionStyle = .none
      
      return cell
      
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
      cell.titleLabel.text = "WHERE?"
      cell.selectionStyle = .none
      
      return cell
      
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
      cell.selectionStyle = .none
      if let restaurantLocation = restaurant.location {
        cell.configure(location: restaurantLocation)
      }
      
      return cell
      
    default:
      fatalError("Failed to instantiate the table view cell for detail view controller")
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showMap" {
      
      let destinationController = segue.destination as! RestaurantMapViewController
      destinationController.restaurant = restaurant
      
    } else if segue.identifier == "showReview" {
      let destinationController = segue.destination as! ReviewViewController
      
      destinationController.restaurant = restaurant
    }
  }
  
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    let cellHeight: CGFloat = CGFloat((indexPath.count) * 44)
//    return self.tableView.bounds.size.height - cellHeight
//  }
  
//  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//    return 0
//  }

}
