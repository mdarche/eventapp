//
//  NavigationController.swift
//  EventApp
//
//  Created by Michael Darche on 7/9/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    func visualize() {
        self.navigationBar.barTintColor = Colors.primaryBlue
        
        self.navigationBar.layer.shadowOffset = CGSizeMake(0, 2)
        self.navigationBar.layer.shadowRadius = 2.5
        self.navigationBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).CGColor
        self.navigationBar.layer.shadowOpacity = 0.3
    }
    
}
