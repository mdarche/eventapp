//
//  AttendingTableCell.swift
//  EventApp
//
//  Created by Michael Darche on 6/10/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class AttendingTableCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }

    func initialize() {
        userProfileImage.layer.cornerRadius = CGRectGetWidth(userProfileImage.frame) / 2
    }

}
