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
    var gridMedia: [Media]?
    
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.hidden = false
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    
    // MARK: - View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == Segues.showMediaFeedView {
//            guard let vc = segue.destinationViewController as? MediaFeedViewController else { return }
//        }
    }
    
    
    // MARK: - Class Functions
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden ?? false
    }
    
    func visualize() {
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.minimumLineSpacing = 1
        collectionView?.collectionViewLayout = flowLayout
    }
}



extension MediaGridViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedCell", forIndexPath: indexPath) as! MediaGridCell
        
        let imageName = (indexPath.row % 2 == 0) ? "NickCage": "feedImage"
        cell.imageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowMediaFeedView", sender: self)
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0,1:
            let numberOfColumns: CGFloat = 2
            let itemWidth = (CGRectGetWidth(self.collectionView!.frame) - (numberOfColumns - 1)) / numberOfColumns
            return CGSizeMake(itemWidth, 200)
        case 2:
            return CGSize(width: collectionView.frame.size.width, height: 112)
        default:
            let numberOfColumns: CGFloat = 3
            let itemWidth = (CGRectGetWidth(collectionView.frame) - (numberOfColumns - 1)) / numberOfColumns
            return CGSizeMake(itemWidth, itemWidth)
        }
        
    }
}


