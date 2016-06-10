//
//  MapCalloutView.swift
//  EventApp
//
//  Created by Michael Darche on 6/8/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import Haneke

class MapCalloutView: UIView {
    

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageThumbnail: UIImageView!
    

    
    override func hitTest( point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convertPoint(point, toView: self) ?? point
//        let isInsideView = pointInside(viewPoint, withEvent: event)
        let view = super.hitTest(viewPoint, withEvent: event)
        
        return view
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(bounds, point)
    }
    
    func setViewData(annotation: MapAnnotationView) {
        titleLabel.text = annotation.title
        imageThumbnail.hnk_setImageFromURL(annotation.coverImage!)
    }
}

