//
//  ProfileSwitchHeader.swift
//  EventApp
//
//  Created by Michael Darche on 8/12/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

protocol ToggleGridLayoutDelegate: class{
    func switchOn(bool: Bool)
}

class ProfileSwitchHeader: UICollectionReusableView {
    
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var mediaButton: UIButton!
    
    let black = UIColor(white: 0, alpha: 0.87)
    let gray = UIColor(white: 0, alpha: 0.30)
    
    var delegate: ToggleGridLayoutDelegate? = nil
    var listView: Bool?

    override func awakeFromNib() {
        super.awakeFromNib()
        visualize()
    }
    
    func visualize() {
        let listImage = UIImage(named:"listLayout")?.imageWithRenderingMode(
            UIImageRenderingMode.AlwaysTemplate)
        activitiesButton.setImage(listImage, forState: .Normal)
        activitiesButton.tintColor = black
        activitiesButton.setTitleColor(black, forState: .Normal)

        
        let gridImage = UIImage(named:"gridLayout")?.imageWithRenderingMode(
            UIImageRenderingMode.AlwaysTemplate)
        mediaButton.setImage(gridImage, forState: .Normal)
        mediaButton.tintColor = gray
        mediaButton.setTitleColor(gray, forState: .Normal)

        
        
    }
    
    @IBAction func activitiesPressed(sender: AnyObject) {
        delegate?.switchOn(true)
        activitiesButton.setTitleColor(black, forState: .Normal)
        activitiesButton.tintColor = black
        mediaButton.setTitleColor(gray, forState: .Normal)
        mediaButton.tintColor = gray
    }
    
    @IBAction func mediaPressed(sender: AnyObject) {
        delegate?.switchOn(false)
        activitiesButton.setTitleColor(gray, forState: .Normal)
        activitiesButton.tintColor = gray
        mediaButton.setTitleColor(black, forState: .Normal)
        mediaButton.tintColor = black
    }
    
}
