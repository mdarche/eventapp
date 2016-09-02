//
//  MapAnnotation.swift
//  EventApp
//
//  Created by Michael Darche on 5/26/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
   
    var type: String?
    var eventType: String?
    var coordinate: CLLocationCoordinate2D
    var venueTitle: String?
    var venueType: String?
    var title: String?
    var subtitle: String?
    var activityId: Int?
    var coverImage: NSURL?
    
    init(activity: Activity) {
        activityId = activity.activityId
        type = activity.type
        eventType = activity.eventType
        coordinate = CLLocationCoordinate2D(latitude: activity.latitude!, longitude: activity.longitude!)
        venueTitle = activity.venueTitle
        venueType = activity.venueType
        title = activity.title
        coverImage = activity.coverImage
        super.init()
    }
}
