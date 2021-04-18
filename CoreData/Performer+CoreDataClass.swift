//
//  Performer+CoreDataClass.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/17/21.
//
//

import Foundation
import CoreData

@objc(Performer)
public class Performer: NSManagedObject, Codable{

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do{
            try container.encode(image ?? "image url empty", forKey: .image)
        } catch{
            print("Performer encode error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Performer", in: managedObjectContext)
        else{
            fatalError("Performer decode fatal error")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            image = try values.decode(String.self, forKey: .image)
        } catch{
            print("Performer decode error")
        }
    }
    
    enum CodingKeys : String, CodingKey{
        case image = "image"
    }
}
