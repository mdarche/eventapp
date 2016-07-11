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

    private var type : String?
    private var eventType : String?
    private var venueTitle : String?
    private var venueType : String?
    var title : String?
    var coverImage : NSURL?
    var activityId : Int?
    
    private var hitOutside = true
    private var calloutView : MapCalloutView?
    
    var preventDeselection:Bool {
        return !hitOutside
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation:annotation, reuseIdentifier:reuseIdentifier)
        
        if let annotation = annotation as? MapAnnotation {
            
            // Set class variables
            self.coverImage = annotation.coverImage
            self.activityId = annotation.activityId
            self.title = annotation.title
            
            // Set annotation icon
            if annotation.type == "event" {
                self.type = "Event"
                self.backgroundColor = Colors.darkBlueHalf
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
        self.canShowCallout = false
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MapAnnotationView {
    
    override func setSelected(selected: Bool, animated: Bool) {
        let calloutViewAdded = calloutView?.superview != nil
        
        if (selected || !selected && hitOutside) {
            super.setSelected(selected, animated: animated)
        }
        
        self.superview?.bringSubviewToFront(self)
        
        if (calloutView == nil) {
            calloutView = NSBundle.mainBundle().loadNibNamed("MapCallout", owner: self, options: nil).first as? MapCalloutView
        }
        
        if (self.selected && !calloutViewAdded) {
            UIView.transitionWithView(self, duration: 0.3, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                self.addSubview(self.calloutView!)
                self.calloutView!.setViewData(self)
            }, completion: nil)
        }
        
        if (!self.selected) {
            calloutView?.removeFromSuperview()
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        var hitView = super.hitTest(point, withEvent: event)
        
        if let callout = calloutView {
            if (hitView == nil && self.selected) {
                hitView = callout.hitTest(point, withEvent: event)
            }
        }
        
        hitOutside = hitView == nil
        
        return hitView
    }
    
    
}
