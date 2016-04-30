//
//  MyProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileImageBG: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    let gradient = CAGradientLayer()
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    
    
    func visualize() {
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        profileImage.layer.borderWidth = 1
        
        gradient.colors = [UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0).CGColor, UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0).CGColor]
        gradient.frame = self.view.bounds
        gradient.locations = [0.0, 1.0]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
}
