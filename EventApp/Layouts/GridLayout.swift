//
//  GridLayout.swift
//  EventApp
//
//  Created by Michael Darche on 8/14/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .Vertical
        self.sectionHeadersPinToVisibleBounds = true
    }
    
    // Define the width of each cell, creating a 3 column layout
    func itemWidth() -> CGFloat {
        return (CGRectGetWidth(collectionView!.frame)/3)-1
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSizeMake(itemWidth(), itemWidth())
        }
        get {
            return CGSizeMake(itemWidth(), itemWidth())
        }
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }

}
