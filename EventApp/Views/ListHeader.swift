//
//  ListHeader.swift
//  EventApp
//
//  Created by Michael Darche on 8/5/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ListHeader: UICollectionReusableView {

    @IBOutlet weak var headingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.visualize()
    }
    
    func visualize() {
    
    self.addShadow(0.3, radius: 2.5)
        
    }
    
}
