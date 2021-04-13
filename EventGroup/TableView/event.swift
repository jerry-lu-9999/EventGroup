//
//  event.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/10/21.
//

import Foundation

struct Event: Codable{
    
    var short_title : String    
    var detail : Venue
    var datetime_local : String
    var performers: Performer
}

struct Venue : Codable {
    var address : String
    var extended_address : String
}

struct Performer : Codable {
    var image : String  //URL
    
}
