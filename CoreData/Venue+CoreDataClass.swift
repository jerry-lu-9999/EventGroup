//
//  Venue+CoreDataClass.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/17/21.
//
//

import Foundation
import CoreData

@objc(Venue)
public class Venue: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do{
            try container.encode(address ?? "address empty", forKey: .address)
            try container.encode(extended_address ?? "extended_address empty", forKey: .extend_address)
        } catch{
            print("Venue encode error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Venue", in: managedObjectContext)
        else{
            fatalError("Venue decode fatal error")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            address = try values.decode(String.self, forKey: .address)
            extended_address = try values.decode(String.self, forKey: .extend_address)
        } catch  {
            print("Venue decode error")
        }
    }
    enum CodingKeys : String, CodingKey{
        case address = "address"
        case extend_address = "extended_address"
    }
}
