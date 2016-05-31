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
    var coordinate : CLLocationCoordinate2D
    var venueTitle : String?
    var title : String?
    var coverImage : String?
    
    init(activity: Activity) {
        type = activity.type
        eventType = activity.eventType
        coordinate = CLLocationCoordinate2D(latitude: activity.latitude!, longitude: activity.longitude!)
        venueTitle = activity.venueTitle
        title = activity.title
        coverImage = activity.coverImage
        
        super.init()
    }
}
