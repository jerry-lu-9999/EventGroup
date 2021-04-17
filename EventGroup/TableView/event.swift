//
//  event.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/10/21.
//

import Foundation

struct Response : Codable{
    var events : Array<Event>
}

struct Event: Codable{

    var id : Int
    var title : String
    var venue : Venue
    var datetime_local : String
    var performers: [Performer]
}

struct Venue : Codable {
    var address : String    ///short address
    var extended_address : String ///city, state, and zipcode
}

struct Performer : Codable {
    var image : String  //URL
}
