//
//  MediaFeedCell.swift
//  EventApp
//
//  Created by Michael Darche on 6/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MediaFeedCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageCoverView: UIView!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let featuredHeight = MediaFeedLayoutConstants.Cell.featuredHeight
        let standardHeight = MediaFeedLayoutConstants.Cell.standardHeight
        
        let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
        
        let minAlpha : CGFloat = 0
        let maxAlpha : CGFloat = 0.4
        
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        eventLabel.alpha = delta
        timeLabel.alpha = delta

    }
    
}
