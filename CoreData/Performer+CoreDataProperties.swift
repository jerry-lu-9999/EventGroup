//
//  Performer+CoreDataProperties.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/17/21.
//
//

import Foundation
import CoreData


extension Performer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Performer> {
        return NSFetchRequest<Performer>(entityName: "Performer")
    }

    @NSManaged public var image: String?

}

