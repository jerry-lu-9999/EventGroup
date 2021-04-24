//
//  event.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/10/21.
//

import Foundation
import RealmSwift

class Event: Object{
    
    @objc dynamic var liked : Bool = false
    
    @objc dynamic var id  : Int = 0
    @objc dynamic var title: String?
    @objc dynamic var datetime_local : String?
    
    @objc dynamic var extended_address : String?
    @objc dynamic var imageURL : String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


//struct Event: Codable{
//
//    var id : Int
//    var title : String
//    var venue : Venue
//    var datetime_local : String
//    var performers: [Performer]
//}
//
//struct Venue : Codable {
//    var address : String    ///short address
//    var extended_address : String ///city, state, and zipcode
//}
//
//struct Performer : Codable {
//    var image : String  //URL
//}
