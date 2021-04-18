//
//  Response+CoreDataClass.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/18/21.
//
//

import Foundation
import CoreData

@objc(Response)
public class Response: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do{
            
        } catch{
            print("response encoding error")
        }
    }
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Response", in:managedObjectContext)
        else{
            fatalError("Response decode fatal error")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            events = try values.decode([Event].self, forKey:.events)
        } catch{
            print("response decode error")
        }
    }
    
    enum CodingKeys : String, CodingKey{
        case events = "events"
    }
}
