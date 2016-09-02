//
//  OrganizerFeedCell.swift
//  EventApp
//
//  Created by Michael Darche on 5/5/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class OrganizerNewsCell: UITableViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var profileId: Int?
    var activityId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
        imageThumbnail.layer.cornerRadius = imageThumbnail.frame.size.width/2
    }
    
}
