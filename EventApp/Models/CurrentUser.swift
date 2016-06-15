//
//  CurrentUser.swift
//  EventApp
//
//  Created by Michael Darche on 5/31/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentUser : User {

    var upcomingEvents : [Activity]?
    
    // TODO: Use this User subclass for persistent storage and request shortcuts
    
    override init?(json: JSON) {
        super.init(json: json)
    }
    
    func saveUser(completion: ((successful: Bool, error: NSError?)-> Void)?) {
        
    }
    
}