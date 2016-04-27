//
//  TabBarController.swift
//  EventApp
//
//  Created by Michael Darche on 4/25/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().alpha = 0.85
    }
    
}

extension UINavigationBar {
    

    class func setNavBarColorDefault() {
        //  NavBar appearance
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        UINavigationBar.appearance().barTintColor = UIColor(red: 30/255, green: 33/255, blue: 42/255, alpha: 1)

    }
    
    
}
