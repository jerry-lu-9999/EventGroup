//
//  Venue+CoreDataProperties.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/17/21.
//
//

import Foundation
import CoreData


extension Venue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Venue> {
        return NSFetchRequest<Venue>(entityName: "Venue")
    }

    @NSManaged public var address: String?
    @NSManaged public var extended_address: String?

}
