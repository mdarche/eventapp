//
//  MapAnnotation.swift
//  EventApp
//
//  Created by Michael Darche on 5/26/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation : NSObject, MKAnnotation {
   
    var type : String?
    var eventType : String?
    var latitude : String
    var coordinate : String
    var venueTitle : String?
    var title : String?
    var coverImage : String
    
    init() {
        
        
        super.init()
    }
    
    class func fromActivity(activity: Activity) -> MapAnnotation {
        
    }
    
}
