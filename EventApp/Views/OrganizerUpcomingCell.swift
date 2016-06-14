//
//  OrganizerUpcomingCell.swift
//  EventApp
//
//  Created by Michael Darche on 6/13/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class OrganizerUpcomingCell: UITableViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var activityId: Int?
    var venueId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        visualize()
    }

    func visualize() {
        imageThumbnail.addDarkGradientLayer(imageThumbnail)
    }

}
