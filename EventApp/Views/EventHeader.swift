//
//  EventHeader.swift
//  EventApp
//
//  Created by Michael Darche on 5/10/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EventHeader: UICollectionReusableView {

    var mainColor : UIColor?
    
    @IBOutlet weak var subheaderView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var addEventButton: UIButton!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var directionsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        mainColor = Colors.lightBlue
        
        coverImage.addDarkGradientLayer()
        addEventButton.layer.cornerRadius = addEventButton.frame.size.width/2
        facebookButton.layer.cornerRadius = facebookButton.frame.size.height/2
        directionsButton.layer.cornerRadius = directionsButton.frame.size.height/2
        
        subheaderView.backgroundColor = mainColor
        
        addEventButton.addShadow(0.2, radius: 1.3)
        subheaderView.addShadow(0.4, radius: 2.5)
        infoView.addShadow(0.1, radius: 2)
    }
    
}
