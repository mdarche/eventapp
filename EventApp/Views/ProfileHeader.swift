//
//  ProfileHeader.swift
//  EventApp
//
//  Created by Michael Darche on 5/1/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    private var newValue: Bool?
    private var isFollowing: Bool {
        get {
            // TODO: Query following dictionary here
            newValue = true
            return newValue!
        }
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var headerBG: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        profileImage.layer.borderWidth = 3.5
        followButton.layer.cornerRadius = followButton.frame.size.height/2
        followButton.layer.borderColor = Colors.accentRed.CGColor
        followButton.layer.borderWidth = 0.6
        changeButton(isFollowing)
    }
    
    func changeButton(following: Bool) {
        if following {
            followButton.setTitle("FOLLOWING", forState: .Normal)
            followButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            followButton.backgroundColor = Colors.accentRed
        } else {
            followButton.setTitle("FOLLOW", forState: .Normal)
            followButton.setTitleColor(Colors.accentRed, forState: .Normal)
            followButton.backgroundColor = UIColor.clearColor()
        }
    }
    
    @IBAction func followButtonPressed(sender: AnyObject) {
        if newValue == true {
            newValue = false
        } else {
            newValue = true
        }
        changeButton(newValue!)
    }
    
}
