//
//  MapAnnotationView.swift
//  EventApp
//
//  Created by Michael Darche on 6/5/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotationView: MKAnnotationView {

    var type : String?
    var eventType : String?
    var venueTitle : String?
    var venueType : String?
    var title : String?
    var coverImage : NSURL?
    var activityId : Int?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation:annotation, reuseIdentifier:reuseIdentifier)
        
        if let annotation = annotation as? MapAnnotation {
            
            // Set class variables
            self.coverImage = annotation.coverImage
            self.activityId = annotation.activityId
            
            // Set annotation icon
            if annotation.type == "event" {
                self.type = "Event"
                self.backgroundColor = Colors.mainDarkHalf
                switch annotation.eventType! {
                case "sport-event":
                    self.eventType = "Sports Event"
                    self.image = UIImage(named: "downArrow")
                case "concert":
                    self.eventType = "Concert"
                    self.image = UIImage(named: "downArrow")
                case "beach-party":
                    self.eventType = "Beach Party"
                    self.image = UIImage(named: "downArrow")
                default: break

                }
            } else {
                self.type = "Location"
                self.image = UIImage(named: "venueMarker")
            }
        }
        self.canShowCallout = true
        configureDetailView(self)
    
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Customize Callout
    
    func configureDetailView(annotationView: MapAnnotationView) {
        let width = 300
        let height = 180
        
        let urlString = coverImage
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.hnk_setImageFromURL(urlString!)
        imageView.contentMode = .ScaleAspectFill
        
        annotationView.detailCalloutAccessoryView = imageView
    }
    
}
