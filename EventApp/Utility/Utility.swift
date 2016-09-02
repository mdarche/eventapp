//
//  Utility.swift
//  EventApp
//
//  Created by Michael Darche on 8/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

final class Utility: NSObject {
    
    
    // Filler function for simulated server requests
    
    class func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    // Create generic error alert
    
    class func createErrorAlert(title: String, message: String, buttonTitle: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let buttonOK = UIAlertAction(title: buttonTitle, style: .Cancel) { (action) -> Void in }
        
        alertController.view.tintColor = Colors.primaryBlue
        alertController.addAction(buttonOK)
        
        return alertController
    }
    
    
    // Create header views for TableView
    
    class func createTableHeader(bgColor: UIColor, bottomBorder: Bool, tableView: UITableView?) -> UIView {
        
        let header = UIView()
        header.backgroundColor = bgColor
        
        if (bottomBorder) {
            let bottomBorder = UIView(frame: CGRect(x: 0, y: 30, width: tableView!.frame.width, height: 1))
            bottomBorder.backgroundColor = Colors.borderGray
            header.addSubview(bottomBorder)
        }
        return header
    }
    
    class func createHeaderLabel(color:UIColor) -> UILabel {
        
        let headerLabel = UILabel(frame: CGRect(x: 12, y: 0, width: 150, height: 30))
        headerLabel.font = UIFont(name: "Roboto-Medium", size: 12)
        headerLabel.textColor = color
        headerLabel.textAlignment = .Left
        
        return headerLabel
    }
    
    
    // Create custom navigation bar for Profile and Activities
    
    class func addStatusBarBG(navController: UINavigationController) -> UIView {
        
        let statusBarBG = UIView(frame: CGRect(x: 0, y: -UIApplication.sharedApplication().statusBarFrame.height, width: (navController.navigationBar.frame.width), height: UIApplication.sharedApplication().statusBarFrame.height))
        statusBarBG.backgroundColor = Colors.darkestBlue
        navController.navigationBar.addSubview(statusBarBG)
        navController.navigationBar.sendSubviewToBack(statusBarBG)
        
        return statusBarBG
    }
    
    class func createCustomNav(navController: UINavigationController) -> UIView {
        
        let customNav = UIView(frame: CGRect(x: 0, y: -UIApplication.sharedApplication().statusBarFrame.height - 64, width: (navController.navigationBar.frame.width), height: 64))
        customNav.clipsToBounds = true
        customNav.backgroundColor = Colors.darkestBlue
        navController.navigationBar.addSubview(customNav)
        navController.navigationBar.sendSubviewToBack(customNav)
        customNav.userInteractionEnabled = false
        
        return customNav
    }
    
    class func createCustomNavHeader(navController: UINavigationController, text: String) -> UILabel {
        
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 48, width: navController.navigationBar.frame.width, height: navController.navigationBar.frame.height))
        headerLabel.font = UIFont(name: "Roboto-Regular", size: 15)
        headerLabel.text = text
        headerLabel.textAlignment = .Center
        headerLabel.textColor = UIColor.whiteColor()
        
        return headerLabel

    }

    
}
