//
//  EventViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EventViewController: UICollectionViewController {

    var parentNavColor : UIColor?
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.barTintColor = Colors.primaryPurple
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.barTintColor = parentNavColor
    }
    
    func visualize(){
        collectionView?.addInvisibleHeader(Colors.darkPurple, sender: self.collectionView!, size: 200)
    }
    

    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.eventMediaCell, forIndexPath: indexPath) as? EventMediaCell else {
            return UICollectionViewCell()
        }
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
             atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: Identifiers.eventHeader, forIndexPath: indexPath) as! EventHeader
        
        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
            referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 712.0)
    
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 320)

    }
    
    
    // MARK: UICollectionViewDelegate
    
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector,
             forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
    }
    
}
