//
//  Restaurant.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/4/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import Foundation

class Restaurant {
  var name: String
  var type: String
  var location: String
  var image: String
  var phone: String
  var description: String
  var isVisited: Bool
  var rating: String
  
  init(name: String, type: String, location: String, image: String, isVisited: Bool, phone: String, description: String, rating:String = " ") {
    self.name = name
    self.type = type
    self.location = location
    self.image = image
    self.isVisited = isVisited
    self.phone = phone
    self.description = description
    self.rating = rating
  }
  
  convenience init() {
    self.init(name: "", type: "", location: "", image: "", isVisited: false, phone: "", description: "")
  }
}
