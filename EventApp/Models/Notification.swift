//
//  Notification.swift
//  EventApp
//
//  Created by Michael Darche on 6/14/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class Notification: NSObject {
    
    var type: String?
    var message: String?
    var timestamp: String?
    var imageThumb: NSURL?
    
    var activityId: Int?
    var profileId: Int?
    
    init?(json: JSON) {
        super.init()
        
        type = json["type"].string
        message = json["message"].string
        timestamp = json["timestamp"].string
        imageThumb = json["coverImage"].URL
        
        activityId = json["activityId"].int
        profileId = json["profileId"].int
        
        if message == nil || imageThumb == nil { return nil }
    }
}
