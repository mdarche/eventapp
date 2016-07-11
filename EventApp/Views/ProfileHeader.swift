//
//  ProfileHeader.swift
//  EventApp
//
//  Created by Michael Darche on 5/1/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var headerBG: UIImageView!
    @IBOutlet weak var shadowView: UIView!

    
    @IBOutlet weak var followButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        profileImage.layer.borderWidth = 1
        headerBG.addColorGradient()
        shadowView.addShadow(0.8, radius: 2)
        followButton.addShadow(0.8, radius: 2)
    }
    
}
