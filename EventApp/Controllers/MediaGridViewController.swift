//
//  MediaGridViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/28/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MediaGridViewController: UICollectionViewController {
    
    var gridMedia : [Media]?
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.collectionViewLayout = GridViewLayout()
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
//        if segue.identifier == Segues.showMediaFeedView {
//            guard let vc = segue.destinationViewController as? MediaFeedViewController else { return }
//        }
    }
    
    
    // MARK: Set UI
    
    func visualize() {

    }
}


// MARK: CollectionView Config

extension MediaGridViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 36
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.feedMediaCell, forIndexPath: indexPath) as? MediaGridCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Segues.showMediaFeedView, sender: indexPath)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Identifiers.feedHeader, forIndexPath: indexPath) as? MediaGridHeader else { return UICollectionViewCell() }

        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 0.0)
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
}

