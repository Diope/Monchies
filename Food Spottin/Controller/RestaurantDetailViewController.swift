//
//  RestaurantDetailViewController.swift
//  Food Spottin
//
//  Created by Dion Pettaway on 12/3/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var restaurant = Restaurant()
  
//  @IBOutlet var restaurantImageView: UIImageView!
//  @IBOutlet var restaurantNameView: UILabel!
//  @IBOutlet var restaurantTypeView: UILabel!
//  @IBOutlet var restaurantLocationView: UILabel!
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var headerView: RestaurantDetailHeaderView!
  
  override func viewDidLoad() {
      super.viewDidLoad()

    navigationItem.largeTitleDisplayMode = .never

    tableView.separatorStyle = .none
    tableView.delegate = self
    tableView.dataSource = self
    
    headerView.nameLabel.text = restaurant.name
    headerView.typeLabel.text = restaurant.type
    headerView.headerImageView.image = UIImage(named: restaurant.image)
    headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
    
      // Do any additional setup after loading the view.
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
      cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
      cell.shortTextLabel.text = restaurant.phone
      cell.selectionStyle = .none
      
      return cell
      
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
      cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
      cell.shortTextLabel.text = restaurant.location
      cell.selectionStyle = .none
      
      return cell
      
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
      cell.descriptionLabel.text = restaurant.description
      cell.selectionStyle = .none
      
      return cell
      
    default:
      fatalError("Failed to instantiate the table view cell for detail view controller")
    }
  }

}
