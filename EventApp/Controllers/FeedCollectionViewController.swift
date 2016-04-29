//
//  FeedCollectionViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/28/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import AVFoundation

class FeedCollectionViewController: UICollectionViewController {

    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? FeedViewLayout {
            layout.delegate = self
        }
        
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // TODO
        
    }
    
    
    // MARK: View set up and functions
    
    func visualize() {
        
    }
    
    
    // MARK: CollectionView Setup
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedCell", forIndexPath: indexPath) as! NewsFeedCell
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //        performSegueWithIdentifier("SeeEvent", sender: indexPath)
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
}

extension FeedCollectionViewController : FeedViewLayoutDelegate {
    // 1
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
        //        let photo = photos[indexPath.item]
        //        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        //        let rect  = AVMakeRectWithAspectRatioInsideRect(photo.image!!.size, boundingRect)
        //        return rect.size.height
        return 150
    }
    
    // 2
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
        //        let annotationPadding = CGFloat(4)
        //        let annotationHeaderHeight = CGFloat(17)
        //        let photo = photos[indexPath.item]
        //        let font = UIFont(name: "AvenirNext-Regular", size: 10)!
        //        let commentHeight = photo.heightForComment(font, width: width)
        //        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        //        return height
        return 80
    }
}

