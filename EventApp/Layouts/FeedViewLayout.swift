//
//  FeedViewLayout.swift
//  EventApp
//
//  Created by Michael Darche on 4/27/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class FeedViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {
            
        }
        get {
            let numberOfColumns: CGFloat = 3
            
            let itemWidth = (CGRectGetWidth(self.collectionView!.frame) - (numberOfColumns - 1)) / numberOfColumns
            return CGSizeMake(itemWidth, itemWidth)
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = -15
        scrollDirection = .Vertical
    }
    
}
