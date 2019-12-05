//
//  RestaurantTableViewController.swift
//  Food Spottin
//
//  Created by Dion Pettaway on 12/2/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
  
  var restaurants:[Restaurant] = [
    Restaurant(name: "Honkai", type: "Chinese", location: "Hong Kong", image: "barrafina", isVisited: false, phone: "091-23924", description: "One of Hong Kong's golden wonders. Honkai is luxury chinese cuisine personified"),
    Restaurant(name: "Petrus", type: "Gourmet", location: "Los Angeles", image: "cafelore", isVisited: false, phone: "432-344050", description: "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!"),
    Restaurant(name: "Yukihira", type: "Japanese", location: "Japan", image: "fiveleaves", isVisited: false, phone: "343-988834", description: "Specialise in great pub food. Established in 1872, we have local and world lagers, craft beer and a selection of wine and spirits for people to enjoy. Don't forget to try our range of Young's Ales and Fish and Chips."),
    Restaurant(name: "Cafe Amor", type: "Cafe", location: "Spain", image: "homei", isVisited: false, phone: "722-232323", description: "Very good basque food, creative dishes with terrific flavors! Donostia is a high end tapas restaurant with a friendly relaxed ambiance. Come over to enjoy awesome tapas!"),
    Restaurant(name: "Amil's", type: "American", location: "New York City", image: "petiteoyster", isVisited: false, phone: "542-343434", description: "a collection of authentic Spanish Tapas bars in Central London! We have an open kitchen, a beautiful marble-topped bar where guests can sit and watch the chefs at work and stylish red leather stools. Lunch starts at 1 PM. Dinners starts 5:30 PM."),
    Restaurant(name: "Nick's On 3rd", type: "American", location: "Orlando", image: "royaloak", isVisited: false, phone: "643-332323", description: "Most delicious cocktail you would ever try! Our menu includes a wide range of high quality internationally inspired dishes, vegetarian options, and local cuisine. We open at 10 AM, and close at 10 PM. We welcome you into our place to enjoy a meal with your friends."),
    Restaurant(name: "Tuscany", type: "Italian", location: "Washington DC", image: "teakha", isVisited: false, phone: "342-455433", description: "Good place, great environment and amazing food! We open at 10 every morning except Sunday, and close at 9 PM. Give us a visit! Enjoy mushroom raviolis, pumpkin raviolis, meat raviolis with sausage and peppers, pork cutlets, eggplant parmesan, and salad."),
    Restaurant(name: "Wolf, Ram, & Heart", type: "Gourmet", location: "San Francisco", image: "traif", isVisited: false, phone: "343-234553", description: " Great food, cocktails, ambiance, service. Nothing beats having a warm dinner and a whiskey. We open at 8 every morning, and close at 1 AM. The ricotta pancakes are something you must try."),
    Restaurant(name: "Parafina", type: "Chinese", location: "London", image: "upstate", isVisited: false, phone: "434-232322", description: "Small shop, some seating, definitely something different! We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of waffles with choices of sweet & savory fillings. If you are gluten free and craving waffles, this is the place to go."),
    Restaurant(name: "Shino's", type: "Japanese", location: "Tokyo", image: "wafflewolf", isVisited: false, phone: "455-232345", description: "Classic Italian deli & butcher draws patrons with meat-filled submarine sandwiches. We use the freshest meats and veggies to create the perfect panini for you. We look forward to seeing you!"),
    Restaurant(name: "Toronto Ale House", type: "American", location: "Toronto", image: "cafedeadend", isVisited: false, phone: "985-723623", description: "A young crowd populates this pork-focused American eatery in an older Williamsburg neighborhood. We open at 6PM, and close at 11 PM. If you enjoy a shared small plates dinner experience, come over and have a try."),
    Restaurant(name: "Donostia", type: "French", location: "Sydney", image: "palominoespresso", isVisited: false, phone: "343-233221", description: "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM. "),
    Restaurant(name: "Ppaegopa", type: "Korean", location: "Seoul", image: "restaurant", isVisited: false, phone: "872-734343", description: "We offer an assortment of on-site baked goods and sandwiches. This place has always been a favourite among office workers. We open at 7 every morning including Sunday, and close at 4 PM. Come over, have a coffee and enjoy a chit-chat with our baristas."),
    Restaurant(name: "Entree", type: "Gourmet", location: "Houston", image: "donostia", isVisited: false, phone: "734-232323", description: "Haigh's Chocolates is Australia's oldest family owned chocolate maker. We have been making chocolate in Adelaide, South Australia since 1915 and we are committed to the art of premium chocolate making from the cocoa bean. Our chocolates are always presented to perfection in our own retail stores. Visit any one of them and you'll find chocolate tasting, gift wrapping and personalised attention are all part of the service."),
    Restaurant(name: "Teakha", type: "Tea House", location: "Washington DC", image: "forkeerestaurant",  isVisited: false, phone: "982-434343", description: "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!"),
    Restaurant(name: "Posatelier", type: "French", location: "Paris", image: "confessional", isVisited: false, phone: "234-834322", description: "A boutique bakery focusing on artisan breads and pastries paired with inspiration from Japan and Scandinavia. We are crazy about bread and excited to share our artisan bakes with you. We open at 10 every morning, and close at 7 PM."),
    Restaurant(name: "Graham Avenue", type: "French", location: "Seattle", image: "caskpubkitchen", isVisited: false, phone: "232-434222", description: "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM."),
    Restaurant(name: "Inakaya", type: "Japanese", location: "Portland", image: "upstate", isVisited: false, phone: "983-284334", description: "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan."),
  ]
  
//  var restaurantNames = [
//    "Honkai", "Cafe Lore", "Petrus", "Hole In The Wall", "Toronto Ale House", "Uptown", "Triangle's Own", "Cafe Loreli", "Amy's on View", "Shino's", "Donostia", "Parafina", "Sato's", "Inakaya", "Apple Bee's", "Six Points", "Paelmo Caffe", "Hague", "Wolf, Ram, & Heart"
//  ]
//
//  var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
//
//  var restaurantLocation = ["London", "Seoul", "Tokyo", "Osaka", "Frankfurt", "Hong Kong", "New York", "Washington DC", "Atlanta", "Seoul", "Kyoto", "Hong Kong", "London", "Paris", "Tokyo", "Paris", "Los Angeles", "Frankfurt", "Amsterdam", "London", "Sydney" ]
//
//  var restaurantTypes = ["Cafe", "American", "French", "Japanese", "Southern", "Bakery", "Bunch", "Thai", "Gourmet", "Americana", "Wine", "Coffee & Tea", "Breakfast", "Spanish", "Korean", "Chinese", "French", "Gourmet", "Cafe"]
//
//  var restaurantVisited = Array(repeating: false, count: 19)

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationController?.navigationBar.prefersLargeTitles = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            
      
      return restaurants.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cellIdentifier = "dataCell"
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
      cell.nameLabel.text = restaurants[indexPath.row].name
      cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
      cell.locationLabel.text = restaurants[indexPath.row].location
      cell.typeLabel.text = restaurants[indexPath.row].type
      cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true
    
      return cell
    }
  
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    //Action Sheet
//    let optionMenu = UIAlertController(title: nil, message: "What Do You Want To Do?", preferredStyle: .actionSheet)
//
//    if let popoverController = optionMenu.popoverPresentationController {
//      if let cell = tableView.cellForRow(at: indexPath) {
//        popoverController.sourceView = cell
//        popoverController.sourceRect = cell.bounds
//      }
//    }
//
//
//    // Actions
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//    optionMenu.addAction(cancelAction)
//
//
//    let callActionHandler = {(action: UIAlertAction!) -> Void in
//      let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not yet implemented", preferredStyle: .alert)
//      alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//      self.present(alertMessage, animated: true, completion: nil)
//    }
//
//    let callAction = UIAlertAction(title: "Call " + "281-000-80\(indexPath.row)", style: .default, handler: callActionHandler)
//    optionMenu.addAction(callAction)
//
//    let checkInTitle = self.restaurantVisited[indexPath.row] ? "Undo Check In" : "Check In"
//    let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
//      (action: UIAlertAction!) -> Void in
//          let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
//          cell?.heartImageView.isHidden = self.restaurantVisited[indexPath.row]
//          self.restaurantVisited[indexPath.row] = self.restaurantVisited[indexPath.row] ? false : true
//        }
//    )
//    optionMenu.addAction(checkInAction)
//
//    // Display Menu
//    present(optionMenu, animated: true, completion: nil)
//    tableView.deselectRow(at: indexPath, animated: false)
//  }
  
  
  override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
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
  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
      (action, sourceView, completionHandler) in
      self.restaurants.remove(at: indexPath.row)
    
      self.tableView.deleteRows(at: [indexPath], with: .fade)
      
      completionHandler(true)
      
    }
    
    let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
      let defaultText = "Just checked in at " + self.restaurants[indexPath.row].name
      let activityController: UIActivityViewController
      if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
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
      if let indexPath = tableView.indexPathForSelectedRow {
        let destinationController = segue.destination as! RestaurantDetailViewController
        
        destinationController.restaurant = restaurants[indexPath.row]
      }
    }
  }
    
  //MARK: - Navigation


}
