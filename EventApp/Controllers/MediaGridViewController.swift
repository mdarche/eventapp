//
//  MediaGridViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/28/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MediaGridViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let flowLayout = UICollectionViewFlowLayout()
    var gridMedia : [Media]?
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == Segues.showMediaFeedView {
//            guard let vc = segue.destinationViewController as? MediaFeedViewController else { return }
//        }
    }
    
    
    // MARK: Set UI
    
    func visualize() {
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.minimumLineSpacing = 1
        flowLayout.scrollDirection = .Vertical
        collectionView?.collectionViewLayout = flowLayout
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedCell", forIndexPath: indexPath) as! MediaGridCell
        
        let imageName = (indexPath.row % 2 == 0) ? "NickCage" : "feedImage"
        cell.imageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0,1,7,8,16,17,27,28:
            let numberOfColumns: CGFloat = 2
            let itemWidth = (CGRectGetWidth(self.collectionView!.frame) - (numberOfColumns - 1)) / numberOfColumns
            return CGSizeMake(itemWidth, 150)
        case 2,3,15,35:
            return CGSize(width: collectionView.frame.size.width, height: 112)
        default:
            let numberOfColumns: CGFloat = 3
            let itemWidth = (CGRectGetWidth(collectionView.frame) - (numberOfColumns - 1)) / numberOfColumns
            return CGSizeMake(itemWidth, itemWidth)
        }
        
    }
}


