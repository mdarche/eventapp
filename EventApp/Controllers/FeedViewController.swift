//
//  FeedViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/28/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController {
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.collectionViewLayout = FeedViewLayout()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    
    // MARK: Set UI
    
    func visualize() {
        
    }
}


// MARK: CollectionView Config

extension FeedViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 24
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.feedMediaCell, forIndexPath: indexPath) as! NewsFeedCell
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//                performSegueWithIdentifier(Segues.showMedia, sender: indexPath)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Identifiers.feedHeader, forIndexPath: indexPath) as! NewsFeedHeader

        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 0.0)
        
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
}

