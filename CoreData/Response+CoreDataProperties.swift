//
//  Response+CoreDataProperties.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/18/21.
//
//

import Foundation
import CoreData


extension Response {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Response> {
        return NSFetchRequest<Response>(entityName: "Response")
    }

    @NSManaged public var events: [Event]?

}
