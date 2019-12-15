//
//  RestaurantMO+CoreDataProperties.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/15/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//
//

import Foundation
import CoreData


extension RestaurantMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantMO> {
        return NSFetchRequest<RestaurantMO>(entityName: "Restaurant")
    }

    @NSManaged public var type: String?
    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var isVisited: Bool
    @NSManaged public var phone: String?
    @NSManaged public var location: String?
    @NSManaged public var rating: String?
    @NSManaged public var summary: String?

}
