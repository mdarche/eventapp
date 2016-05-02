//
//  Event.swift
//  EventApp
//
//  Created by Michael Darche on 5/1/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class Event {
    
    var eventId : Int?
    var type : String?
    var coordinates : [String : AnyObject]?
    var title: String?
    var coverImage : String?
    var isPrivate : Bool?
    var timestamp : String?
    var totalNumberOfAttendees : Int?
    var attendees : [[String : AnyObject]]?
    
    init?(eventId: Int) {
        
        self.eventId = eventId
        
//        if eventId.isEmpty || title.isEmpty {
//            return nil
//        }
        
    }
    
    
}
