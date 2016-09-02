//
//  HomeFeedCell.swift
//  EventApp
//
//  Created by Michael Darche on 4/26/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ListFeedCell: UICollectionViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var attendingCountLabel: UILabel!
    @IBOutlet weak var attendingIcon: UIImageView!
    
    
    // MARK: - Class's public methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        imageThumbnail.addDarkGradientLayer()
    }
    
}
