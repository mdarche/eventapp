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
        
        let size = CGSize(width: UIScreen.mainScreen().bounds.width, height: 22)
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let statusBarBG = UIView(frame: rect)
        statusBarBG.backgroundColor = UIColor(red: 43/255, green: 49/255, blue: 63/255, alpha: 1.0)
        
        statusBarBG.layer.shadowColor = UIColor.blackColor().CGColor
        statusBarBG.layer.shadowOffset = CGSize(width: 0, height: 5)
        statusBarBG.layer.shadowOpacity = 0.2
        statusBarBG.layer.shadowRadius = 4
        
        self.view.addSubview(statusBarBG)
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        
    }
    
}
