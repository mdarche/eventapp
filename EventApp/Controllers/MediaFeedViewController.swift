//
//  MediaFeedViewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/17/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MediaFeedViewController: UICollectionViewController {

    var feedMedia : [Media]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView!.backgroundColor = .blackColor()
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
    }
}

extension MediaFeedViewController {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MediaFeedCell", forIndexPath: indexPath) as! MediaFeedCell
//        cell.inspiration = inspirations[indexPath.item]
        return cell
    }
    
}
