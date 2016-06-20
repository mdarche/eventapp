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

    var profileId : Int?
    var profileImage : NSURL?
    var displayName : String?
    
    let testArray : [AnyObject]? = ["string", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var isMe : Bool?
    var didAnimate = false
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Segues.showFFTable {
            guard let vc = segue.destinationViewController as? FFITableviewController, sender = sender as? String else { return }
            if sender == "followers" {
                vc.isFollowers = true
            } else {
                vc.isFollowing = true
            }
        }
    }
    
    func visualize() {
        if isMe == true {
            let settingsButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .Plain, target: self, action: #selector(ProfileViewController.settingsPressed))
            self.navigationItem.rightBarButtonItem = settingsButton
        } else {
            //TODO: Loop through current user's followingID array and change title of button
            let followButtonItem = UIBarButtonItem(title: "FOLLOW", style: .Plain, target: self, action: #selector(ProfileViewController.followUserPressed))
            let font = UIFont.systemFontOfSize(12)
            followButtonItem.setTitleTextAttributes([ NSFontAttributeName: font], forState: .Normal)
            self.navigationItem.rightBarButtonItem = followButtonItem
        }
        
        
        navTitle.hidden = true
        setBackgroundGradient(self, image: UIImage(named: "NickCage"))
    }
    
    func settingsPressed() {
        performSegueWithIdentifier(Segues.showSettingsFromProfile, sender: self)
    }

    func followUserPressed() {
        //TODO: Determine what to make button title and execute request
    }
    
    
    @IBAction func followersPressed(sender: AnyObject) {
        performSegueWithIdentifier(Segues.showFFTable, sender: "followers")
    }
    
    @IBAction func followingPressed(sender: AnyObject) {
        performSegueWithIdentifier(Segues.showFFTable, sender: "following")
    }
    
    
    
}

extension ProfileViewController {
    
    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
            return testArray!.count
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileMediaCell, forIndexPath: indexPath) as! ProfileMediaCell
        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileActivityCell, forIndexPath: indexPath) as! ProfileActivityCell
        
        if let list = self.testArray  {
            if list[indexPath.row] is Int {
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
        
        //TODO: send user data to header file and set up
        
        return header
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int) -> CGSize {
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
