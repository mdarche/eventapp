//
//  HomeFeedCell.swift
//  EventApp
//
//  Created by Michael Darche on 4/26/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class HomeFeedCell: UICollectionViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    
    // MARK: Class's public methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        
        
//        imageThumbnail.layer.cornerRadius = imageThumbnail.frame.size.width/2
//        imageThumbnail.layer.borderColor = UIColor.whiteColor().CGColor
//        imageThumbnail.layer.masksToBounds = true
//        imageThumbnail.layer.borderWidth = 1
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        if let attributes = layoutAttributes as? ListViewLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
        }
    }
    
}
