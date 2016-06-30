//
//  CurrentUser.swift
//  
//
//  Created by Michael Darche on 6/15/16.
//
//

import Foundation
import RealmSwift
import SwiftyJSON


class CurrentUser: Object {
    
    dynamic var profileId = 0
    
    dynamic var displayName: String? = nil
    dynamic var username: String? = nil
    dynamic var firstName: String? = nil
    dynamic var lastName: String? = nil
    dynamic var city: String? = nil
    dynamic var personalDescription: String? = nil
    dynamic var profileImage: String? = nil
    dynamic var email: String? = nil
    
    dynamic var followerCount = 0
    dynamic var followingCount = 0
    dynamic var eventsAttended = 0
    dynamic var eventsMissed = 0
    
    let followingIds = List<Following>()
    let activities = List<Activities>()

    
    override static func primaryKey() -> String? {
        return "profileId"
    }
    
}

class Following: Object {
    dynamic var followingId = 0
    
    override static func primaryKey() -> String? {
        return "followingId"
    }
}

class Activities : Object {
    dynamic var activityId = 0
    dynamic var title : String? = nil
    dynamic var coverImage : String? = nil
    dynamic var eventDate : NSDate? = nil
}




extension CurrentUser {
    
    func updateFromJson(json: JSON) {
        try! realm!.write {
        
        profileId = json["profileId"].int!
        username = json["username"].string
        displayName = json["displayName"].string
        firstName = json["name"].string
        lastName = json["surname"].string
        
        city = json["location"].string
        email = json["email"].string
        personalDescription = json["description"].string
        profileImage = json["avatar"].string
        
        followerCount = json["stats"]["followers"].int!
        followingCount = json["stats"]["following"].int!
        eventsAttended = json["stats"]["eventsAttended"].int!
        eventsMissed = json["stats"]["eventsMissed"].int!
        
        }
    }

    func updateProfile() {
        // TODO: add various params and variables, add completion handler, make network request, save if successful
    }
    
    
    func followUser(follow: Bool, followingId: Int) {
        try! realm!.write {
            if follow {
                followingCount += 1
                followingIds.append(Following(value: ["followingId" : followingId]))
                print("Success")
            } else {
//                var followingAccount = realm?.objects(Following.self).filter("followingId = '\(followingId)'")
//                let index = followingIds.objectf
                followingCount -= 1
                print("Success")
            }
        }
    }
    
    
    // MARK: Event Functions
    
    func attendEvent(){
        // TODO: make network request and save
    }
    
    func unattendEvent(){
        
    }
    
    
}
