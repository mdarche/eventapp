//
//  FFITableViewCell.swift
//  EventApp
//
//  Created by Michael Darche on 6/20/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class FFITableViewCell: UITableViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // MARK: Class's public methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        imageThumbnail.layer.cornerRadius = imageThumbnail.frame.size.width/2
    }
    
}
