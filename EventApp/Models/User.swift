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
    var upcomingEvents = [Event]()
    var pastEvents = [Event]()
    var media = [Media]()
    
    init?(object: AnyObject){
        profileId = object["profileId"] as? Int
        username = object["username"] as? String
        displayName = object["displayName"] as? String
        name = object["name"] as? String
        surname = object["surname"] as? String
        city = object["location"] as? String
        profileImage = object["avatar"] as? String
        
    }
    
    
}
