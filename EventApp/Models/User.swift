//
//  User.swift
//  EventApp
//
//  Created by Michael Darche on 5/20/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: NSObject {
    
    var profileId: Int?
    var username: String?
    var displayName: String?
    var name: String?
    var surname: String?
    
    var location: String?
    var email: String?
    var personalDescription: String?
    var profileImage: NSURL?
    
    var followerCount: Int?
    var followingCount: Int?
    var eventsAttended: Int?
    var eventsMissed: Int?
    
    
    init?(json: JSON) {
        profileId = json["profileId"].int
        username = json["username"].string
        displayName = json["displayName"].string
        name = json["name"].string
        surname = json["surname"].string
        
        location = json["location"].string
        email = json["email"].string
        personalDescription = json["description"].string
        profileImage = json["avatar"].URL
        
        followerCount = json["stats"]["followers"].int
        followingCount = json["stats"]["following"].int
        eventsAttended = json["stats"]["eventsAttended"].int
        eventsMissed = json["stats"]["eventsMissed"].int
        
        if profileId == nil { return nil }
    }
    
}


