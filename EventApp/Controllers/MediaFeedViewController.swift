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
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBarHidden = false
        
        let whiteView: UIView = UIView(frame: CGRectMake(0.0, -260.0, UIScreen.mainScreen().bounds.width, 260.0))
        whiteView.backgroundColor = .whiteColor()
        collectionView?.addSubview(whiteView)
        
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
        let imageName = (indexPath.row % 2 == 0) ? "NickCage" : "feedImage"
        cell.imageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Segues.showMediaDetail, sender: self)
    }
    
}
