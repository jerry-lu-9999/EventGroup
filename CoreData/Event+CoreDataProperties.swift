//
//  Event+CoreDataProperties.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/17/21.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var liked : Bool
    @NSManaged public var datetime_local: String?
    @NSManaged public var id: Int32
    @NSManaged public var performers: [Performer]?
    @NSManaged public var title: String?
    @NSManaged public var venue: Venue?

}
