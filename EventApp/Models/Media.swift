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
    
    var mediaId : Int?
    var mimeType : String?
    var mediaURL: String?
    var previewURL: String?
    
    
    // Initializers for Object or JSON
    
    init?(object: AnyObject){
        mediaId = object["mediaId"] as? Int
        mimeType = object["mimeType"] as? String
        mediaURL = object["location"] as? String
        previewURL = object["preview"] as? String
        
        if mediaId == nil { return nil }
    }
    
    
    init?(json: JSON) {
        mediaId = json["mediaId"].int
        mimeType = json["mimeType"].string
        mediaURL = json["location"].string
        previewURL = json["preview"].string
        
        if mediaId == nil { return nil }
    }
    
}