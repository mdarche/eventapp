//
//  Event.swift
//  EventApp
//
//  Created by Michael Darche on 5/1/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class Event: NSObject {
    
    var eventId : Int?
    var type : String?
    var latitude: String?
    var longitude: String?
    var title: String?
    var coverImage : String?
    var timestamp : String?
    var totalNumberOfAttendees : Int?
    var details: String?
    var attendees = [User]()
    var media = [Media]()
    
    // MARK: Initializers for JSON and Object
    
    init?(json: JSON) {
        eventId = json["eventId"].int
        title = json["title"].string
        details = json["description"].string
        coverImage = json["coverImage"].string
        totalNumberOfAttendees = json["totalNumberofAttendees"].int
        latitude = json["coordinates"]["latitude"].string
        longitude = json["coordinates"]["longitude"].string
        type = json["type"].string
        timestamp = json["timestamp"].string
        
        if eventId == nil { return nil }
    }
    
    init?(object: AnyObject) {
        eventId = object["eventId"] as? Int
        title = object["title"] as? String
        coverImage = object["coverImage"] as? String
        totalNumberOfAttendees = object["totalNumberofAttendees"] as? Int
        type = object["type"] as? String
        timestamp = object["timestamp"] as? String
        
        if eventId == nil { return nil }
    }
    
}



extension Event {
    
    func addEventDetails(originalEvent: Event, json: JSON) -> Event {
        let updatedEvent = originalEvent
        updatedEvent.details = json["description"].string

        if let mediaArray = json["media"].arrayObject {
            for m in mediaArray {
                let post = Media(object: m)
                updatedEvent.media.append(post!)
            }
        }
        
//        if let attendeeArray = json["attendees"].arrayObject {
//            for attendee in attendeeArray {
//                let person = User(object: attendee)
//                updatedEvent.attendees.append(person!)
//            }
//        }
        
        return updatedEvent
    }
    
}
