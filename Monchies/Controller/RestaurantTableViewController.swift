//
//  RestaurantTableViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/2/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit
import CoreData

class RestaurantTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {
  
    
    var addButton = UIButton(type: .custom)
    var brandColor = UIColor(red: 0.004207400605, green: 0.8167108297, blue: 0.8440560699, alpha: 1)
    var restaurants: [RestaurantMO] = []
    var fetchResultController: NSFetchedResultsController<RestaurantMO>!
    var searchController: UISearchController!
    var searchResults: [RestaurantMO] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyRestaurantView: UIView!
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
      dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
      performSegue(withIdentifier: "addRestaurant", sender: self)
    }
 

    override func viewDidLoad() {
      
      super.viewDidLoad()
      navigationController?.navigationBar.prefersLargeTitles = true
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationController?.navigationBar.shadowImage = UIImage()
      if let customFont = UIFont(name: "Raleway-Medium", size: 40.0) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: brandColor, NSAttributedString.Key.font: customFont]
      }
      
      self.addButton.setTitleColor(UIColor.orange, for: .normal)
      self.addButton.addTarget(self, action: #selector(buttonClick(_:)), for: UIControl.Event.touchUpInside)
      self.view.addSubview(addButton)
      
      navigationController?.hidesBarsOnSwipe = true
      
      tableView.backgroundView = emptyRestaurantView
      tableView.backgroundView?.isHidden = true
      
      // MARK: - NSFetching
      let fetchRequest: NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
      let nameSort = NSSortDescriptor(key: "name", ascending: true)
      fetchRequest.sortDescriptors = [nameSort]
      
      if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
        let context = appDelegate.persistentContainer.viewContext
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        do {
          try fetchResultController.performFetch()
          if let fetchedObjects = fetchResultController.fetchedObjects {
            restaurants = fetchedObjects
          }
        } catch  {
          print(error)
        }
      }
      
      // MARK: - ViewDidLoad Search
      searchController = UISearchController(searchResultsController: nil)
      tableView.tableHeaderView = searchController.searchBar
      
      searchController.searchResultsUpdater = self
      searchController.obscuresBackgroundDuringPresentation = false
      searchController.searchBar.placeholder = "Search through your collection"
      searchController.searchBar.backgroundImage = UIImage()
      searchController.searchBar.tintColor = #colorLiteral(red: 0.980392158, green: 0.4980392158, blue: 0.4235294163, alpha: 1)
      searchController.searchBar.searchBarStyle = .minimal
    }
  
  override func viewDidAppear(_ animated: Bool) {
    let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
    if let onboardViewController = storyboard.instantiateViewController(identifier: "OnboardViewController") as? OnboardViewController {
      present(onboardViewController, animated: true, completion: nil)
    }
  }
  
  override func viewWillLayoutSubviews() {

    addButton.layer.cornerRadius = addButton.layer.frame.size.width/2
    addButton.backgroundColor = brandColor
    addButton.clipsToBounds = true
    addButton.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
    addButton.tintColor = UIColor.white
    addButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45).cgColor
    addButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
    addButton.layer.masksToBounds = false
    addButton.layer.shadowOpacity = 1.0
    addButton.layer.shadowRadius = 1.5
    
    
      addButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate(
        [
          addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -36),
          addButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40),
          addButton.widthAnchor.constraint(equalToConstant: 56),
          addButton.heightAnchor.constraint(equalToConstant: 56)]
    )
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.hidesBarsOnSwipe = true
  }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        
      return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if restaurants.count > 0 {
        tableView.backgroundView?.isHidden = true
        tableView.separatorStyle = .singleLine
      } else {
        tableView.backgroundView?.isHidden = false
        tableView.separatorStyle = .none
      }
      
      if searchController.isActive {
        return searchResults.count
      } else {
        return restaurants.count
      }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      
      let cellIdentifier = "dataCell"
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
      
      _ = (searchController.isActive) ? searchResults[indexPath.row] : restaurants[indexPath.row]

      cell.nameLabel.text = restaurants[indexPath.row].name
      cell.nameLabel.textColor = .white
      
      cell.locationLabel.text = restaurants[indexPath.row].location
      cell.locationLabel.textColor = .white
      cell.locationLabel.shadowColor = .init(white: 1, alpha: 0.25)
      
      cell.typeLabel.text = restaurants[indexPath.row].type
      cell.typeLabel.textColor = .white
      
      
      if let restaurantImage = restaurants[indexPath.row].image {
        cell.thumbnailImageView.image = UIImage(data: restaurantImage as Data)
      }
      cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true
    
      return cell
    }
  
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let checkInAction = UIContextualAction(style: .normal, title: "Check In") {
      (action, sourceView, completionHandler) in
        let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
      self.restaurants[indexPath.row].isVisited = self.restaurants[indexPath.row].isVisited ? false : true
      cell.heartImageView.isHidden = self.restaurants[indexPath.row].isVisited ? false : true

      
      completionHandler(true)
    }
    let checkInIcon = restaurants[indexPath.row].isVisited ? "arrow.uturn.left" : "checkmark"
    checkInAction.backgroundColor = UIColor(red: 0.4392156899, green: 0.7921568751, blue: 0.5607843399, alpha: 1)
    checkInAction.image = UIImage(systemName: checkInIcon)
    
    let swipeConfig = UISwipeActionsConfiguration(actions: [checkInAction])
    return swipeConfig
  }
  
  // Deleting via swipe to the left (lead is swiping right, trailing is swiping left)
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
      (action, sourceView, completionHandler) in
      // Delete from store
      if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
        let context = appDelegate.persistentContainer.viewContext
        let restaurantToDelete = self.fetchResultController.object(at: indexPath)
        
        context.delete(restaurantToDelete)
        appDelegate.saveContext()
      }
      
      completionHandler(true)
      
    }
    
    let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
      let defaultText = "Just checked in at " + self.restaurants[indexPath.row].name!
      let activityController: UIActivityViewController
      if let restaurantImage = self.restaurants[indexPath.row].image, let imageToShare = UIImage(data: restaurantImage as Data) {
        activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
        } else {
        activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
      }
      self.present(activityController, animated: true, completion: nil)
      completionHandler(true)
    }
    
    deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
    deleteAction.image = UIImage(systemName: "trash")
    
    shareAction.backgroundColor = UIColor(red: 0.08627451211, green: 0.6078431606, blue: 0.7098039389, alpha: 1)
    shareAction.image = UIImage(systemName: "square.and.arrow.up")
    
    let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
    return swipeConfig
  }
  
  //MARK: - Segue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showRestaurantDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let destinationController = segue.destination as! RestaurantDetailViewController
        
        destinationController.restaurant = (searchController.isActive) ? searchResults[indexPath.row] : restaurants[indexPath.row]
      } else if segue.identifier == "addRestaurant" {
        let _ = segue.destination as! AddRestaurantController
      }
    }
  }
    
  //MARK: - Fetched Results Methods

  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    
    switch type {
    case .insert:
      if let newIndexPath = newIndexPath {
        tableView.insertRows(at: [newIndexPath], with: .fade)
      }
    case .delete:
      if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
    case .update:
      if let indexPath = indexPath {
        tableView.reloadRows(at: [indexPath], with: .fade)
      }
    default:
      tableView.reloadData()
    }
    
    if let fetchedObjects = controller.fetchedObjects {
      restaurants = fetchedObjects as! [RestaurantMO]
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.endUpdates()
  }
  
  //MARK: - Search
  func searchFilter(for searchText: String) {
    searchResults = restaurants.filter({(restaurant) -> Bool in
      if let name = restaurant.name {
        let isMatch = name.localizedCaseInsensitiveContains(searchText)
        return isMatch
      } else if let location = restaurant.location {
        let isMatch = location.localizedCaseInsensitiveContains(searchText)
        return isMatch
      }
      return false
    })
  }
  
  func updateSearchResults(for searchController: UISearchController) {
    if let searchText = searchController.searchBar.text {
      searchFilter(for: searchText)
      tableView.reloadData()
    }
  }

}
