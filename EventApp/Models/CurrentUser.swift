//
//  CurrentUser.swift
//  
//
//  Created by Michael Darche on 6/15/16.
//
//

import Foundation
import CoreData
import SwiftyJSON


class CurrentUser: NSManagedObject {

    @NSManaged var displayName: String?
    @NSManaged var username: String?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var city: String?
    @NSManaged var profileId: NSNumber?
    @NSManaged var personalDescription: String?
    @NSManaged var profileImage: String?
    @NSManaged var email: String?
    @NSManaged var followerCount: NSNumber?
    @NSManaged var followingCount: NSNumber?
    @NSManaged var eventsAttended: NSNumber?
    @NSManaged var eventsMissed : NSNumber?
    
    @NSManaged var followingIds : [String]?

    
}


extension CurrentUser {
    
    // MARK: Profile Functions
    
    func updateFromJson(json: JSON) {
        
        profileId = json["profileId"].int
        username = json["username"].string
        displayName = json["displayName"].string
        firstName = json["name"].string
        lastName = json["surname"].string
        
        city = json["location"].string
        email = json["email"].string
        personalDescription = json["description"].string
        profileImage = json["avatar"].string
        
        followerCount = json["followers"].int
        followingCount = json["following"].int
        eventsAttended = json["eventsAttended"].int
        eventsMissed = json["eventsMissed"].int
    }

    func updateProfile() {
        // TODO: add various params and variables, add completion handler, make network request, save if successful
    }
    
    
//    func getUserProfile() -> User {
//        
//    }
    
    
    // MARK: Following Functions
    
    func followUser(follow: Bool, followingId: String) {
//        if follow {
//            followingCount += 1
//            // TODO: add string to array and save
//        } else {
//            followingCount -= 1
//            //TODO: remove string from array and save
//        }
    }
    
    
    // MARK: Event Functions
    
    func attendEvent(){
        // TODO: make network request and save
    }
    
    func unattendEvent(){
        
    }
    
    
    // MARK: Save Current User 
    
    func saveCurrentUser() {
        
    }
}
