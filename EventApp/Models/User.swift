//
//  User.swift
//  EventApp
//
//  Created by Michael Darche on 5/20/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class User : NSObject {
    
    var profileId : Int?
    var username : String?
    var displayName: String?
    var name: String?
    var surname: String?
    var city: String?
    var email: String?
    var personalDescription: String?
    var profileImage : String?
    
    var followerCount : Int?
    var followingCount : Int?
    var pastEventsCount: Int?
    
    var upcomingEvents = [Event]()
    var pastEvents = [Event]()
    var media = [Media]()
    
    
    // Initializers for Object or JSON
    
    init?(object: AnyObject){
        profileId = object["profileId"] as? Int
        username = object["username"] as? String
        displayName = object["displayName"] as? String
        city = object["location"] as? String
        profileImage = object["avatar"] as? String
        followerCount = object["followerCount"] as? Int
        followingCount = object["followingCount"] as? Int
        pastEventsCount = object["pastEventsCount"] as? Int
        
        if profileId == nil { return nil }
    }
    
    init?(json: JSON) {
        profileId = json["profileId"].int
        username = json["username"].string
        displayName = json["displayName"].string
        city = json["location"].string
        profileImage = json["avatar"].string
        followerCount = json["followerCount"].int
        followingCount = json["followingCount"].int
        pastEventsCount = json["pastEventsCount"].int
        
        if profileId == nil { return nil }
    }
    
}

extension User {
    
    func addUserDetails(user: User, json: JSON) -> User {
        let updatedUser = user
        updatedUser.personalDescription = json["description"].string
        
        if let mediaArray = json["media"].arrayObject {
            for m in mediaArray {
                let post = Media(object: m)
                updatedUser.media.append(post!)
            }
        }
        
        if let upcomingEventsArray = json["upcomingEvents"].arrayObject {
            for e in upcomingEventsArray {
                let event = Event(object: e)
                updatedUser.upcomingEvents.append(event!)
            }
        }
        
        if let pastEventsArray = json["pastEvents"].arrayObject {
            for e in pastEventsArray {
                let event = Event(object: e)
                updatedUser.pastEvents.append(event!)
            }
        }
        
        return updatedUser
    }
    
    
}
