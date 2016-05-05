//
//  ProfileMediaCell.swift
//  EventApp
//
//  Created by Michael Darche on 5/3/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileMediaCell: UICollectionViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    @IBOutlet weak var imageFive: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
//        mainImageWidthConstraint.constant = UICollectionViewCell.frame.width/3
//        mainImageHeightConstraint.constant = mainImageWidthConstraint.constant
        
    }
    
    
    
}
