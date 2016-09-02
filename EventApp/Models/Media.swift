//
//  Media.swift
//  EventApp
//
//  Created by Michael Darche on 5/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import SwiftyJSON

class Media: NSObject {
    
    var mediaId: Int?
    var mimeType: String?
    var mediaURL: NSURL?
    var previewURL: NSURL?
    
    init?(json: JSON) {
        mediaId = json["mediaId"].int
        mimeType = json["mimeType"].string
        mediaURL = json["location"].URL
        previewURL = json["preview"].URL
        
        if mediaId == nil { return nil }
    }
    
}