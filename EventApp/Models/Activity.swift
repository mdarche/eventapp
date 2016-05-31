//
//  Activity.swift
//  EventApp
//
//  Created by Michael Darche on 5/1/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class Activity: NSObject {
    
    var activityId : Int?
    var type : String?
    var eventType : String?
    
    var locationId : Int?
    var latitude : Double?
    var longitude : Double?
    
    var title : String?
    var shortDescription : String?
    var coverImage : String?
    var timestamp : String?
    
    var venueId : Int?
    var venueTitle : String?
    
    var eventRate : Int?
    var venueRate : Int?
    var attendeesCount : Int?
    
    var attendeesPreview = [User]()
    
    
    init?(json: JSON) {
        activityId = json["activityId"].int
        type = json["type"].string
        eventType = json["eventType"].string
        
        locationId = json["location"]["locationId"].int
        latitude = json["location"]["latitude"].double
        longitude = json["location"]["longitude"].double
        
        venueId = json["venue"]["venueId"].int
        venueTitle = json["venue"]["title"].string
        
        title = json["title"].string
        shortDescription = json["shortDescription"].string
        coverImage = json["coverImage"].string
        timestamp = json["timestamp"].string
        
        attendeesCount = json["stats"]["attendees"].int
        eventRate = json["stats"]["eventRate"].int
        venueRate = json["stats"]["venueRate"].int
        
        
        if activityId == nil { return nil }
    }
    
}
