//
//  Event+CoreDataClass.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/17/21.
//
//

import Foundation
import CoreData

@objc(Event)
public class Event: NSManagedObject, Codable {
    
    public func encode(to encoder : Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(id, forKey: .id)
            try container.encode(title ?? "title is empty", forKey: .title)
            try container.encode(datetime_local ?? "date time local", forKey: .datetime_local)
        } catch  {
            print("Event encode error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws{
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Event", in: managedObjectContext)
        else{
            fatalError("Decode event failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            //TODO
            id = try values.decode(Int32.self, forKey: .id)
            title = try values.decode(String.self, forKey: .title)
            venue = try values.decode(Venue.self, forKey: .venue)
            datetime_local = try values.decode(String.self, forKey: .datetime_local)
            performers = try values.decode([Performer].self, forKey: .performers)
        } catch{
            print("Event decode error")
        }
    }
        
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case venue = "venue"
        case datetime_local = "datetime_local"
        case performers = "performers"
    }
}
