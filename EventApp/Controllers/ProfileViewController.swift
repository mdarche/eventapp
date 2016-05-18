//
//  ProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var navTitle: UIView!
    @IBOutlet weak var navTitleConstraint: NSLayoutConstraint!

    let testArray : [AnyObject]? = ["string", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var isMe : Bool?
    var didAnimate = false
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func visualize() {
        if isMe == true {
            let settingsButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .Plain,
                     target: nil, action: #selector(ProfileViewController.settingsPressed))
            
            self.navigationItem.rightBarButtonItem = settingsButton
        }
        navTitle.hidden = true
        setBackgroundGradient(self, image: UIImage(named: "NickCage"), color: UIColor.redColor(), isProfile: true)
    }
    
    func settingsPressed() {
        // TODO: Segue to edit profile screen
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
            return testArray!.count
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileMediaCell, forIndexPath: indexPath) as! ProfileMediaCell
        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileActivityCell, forIndexPath: indexPath) as! ProfileActivityCell
        
        if let list = self.testArray  {
            let item = list[indexPath.row]
            if item is Int {
                return cell1
            } else {
                return cell
            }
        } else {
            return UICollectionViewCell()
        }
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                     atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                       withReuseIdentifier: Identifiers.profileHeader, forIndexPath: indexPath) as! ProfileHeader
        return header
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 213.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let list = self.testArray  {
            let item = list[indexPath.row]
            if item is Int {
                return CGSize(width: collectionView.frame.size.width, height: 77)
            } else {
                return CGSize(width: collectionView.frame.size.width, height: 190)
            }
        } else {
            return CGSize(width: collectionView.frame.size.width, height: 95)
        }
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let currentOffset = scrollView.contentOffset.y
        if didAnimate == false && currentOffset >= 127 {
            UIView.animateWithDuration(2.5, animations: {
                self.navTitle.hidden = false
                self.didAnimate = true
            })
        }
    }
    
    
    // MARK: UICollectionViewDelegate
    

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }

}
