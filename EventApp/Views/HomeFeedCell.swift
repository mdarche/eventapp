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
    
    // MARK: Class's public methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        imageThumbnail.addDarkGradientLayer(imageThumbnail)
    }
    
}
