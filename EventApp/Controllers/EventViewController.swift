//
//  EventViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EventViewController: UICollectionViewController {

    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundGradient(self, image: UIImage(named: "feedImage"), color: nil, isProfile: false)
        
    }
    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.eventMediaCell, forIndexPath: indexPath) as! EventMediaCell
//        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.eventActivityCell, forIndexPath: indexPath) as! EventActivityCell
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
             atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Identifiers.eventHeader, forIndexPath: indexPath) as! EventHeader
        
        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
            referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 563.0)
    
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 330)

    }
    
    
    // MARK: UICollectionViewDelegate
    
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector,
             forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
    }
    
}
