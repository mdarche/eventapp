//
//  Utility.swift
//  EventApp
//
//  Created by Michael Darche on 8/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class Utility : NSObject {
    
    class func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    class func createErrorAlert(title: String, message: String, buttonTitle: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let buttonOK = UIAlertAction(title: buttonTitle, style: .Cancel) { (action) -> Void in }
        
        alertController.view.tintColor = Colors.primaryBlue
        alertController.addAction(buttonOK)
        
        return alertController
    }
    
}
