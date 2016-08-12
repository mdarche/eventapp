//
//  ProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    private var topRefreshControl = TopRefresher()
    var profileId : Int?
    var user : User?
    var currentUser : CurrentUser?
    var parentNavColor: UIColor?
    
    let testArray : [AnyObject]? = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var isMe : Bool?
    
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
            let settingsButton = UIBarButtonItem(image: UIImage(named: "settingsLight"), style: .Plain, target: self, action: #selector(ProfileViewController.settingsPressed))
            self.navigationItem.rightBarButtonItem = settingsButton
        }

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        collectionView?.frame = CGRectMake(0, -64, self.view.frame.width, self.view.frame.height+64)
        collectionView!.addInvisibleHeader(Colors.accentRed, sender: self.collectionView!, size: 100)
        topRefreshControl.setupSubview(.whiteColor(), bgColor: Colors.accentRed)
        topRefreshControl.addTarget(self, action: #selector(ProfileViewController.handleTopPull), forControlEvents: UIControlEvents.ValueChanged)
        collectionView!.addSubview(topRefreshControl)
        
    }
    
    func handleTopPull() {
        Utility.delay(2.5) {
            self.topRefreshControl.endRefreshing()
        }
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
            return testArray!.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileMediaCell, forIndexPath: indexPath) as! ProfileMediaCell
        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileActivityCell, forIndexPath: indexPath) as! ProfileActivityCell
        
        guard let list = self.testArray  else { return UICollectionViewCell() }
        
        if list[indexPath.row] is Int {
            return cell1
        } else {
            return cell
        }
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                     atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                       withReuseIdentifier: Identifiers.profileHeader, forIndexPath: indexPath) as! ProfileHeader
        
        header.headerBG.image = UIImage(named: "NickCage")
        //TODO: send user data to header file and set up
        
        return header
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 426.0)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        guard let list = self.testArray else  { return CGSize(width: collectionView.frame.size.width, height: 95) }
        
            let item = list[indexPath.row]
            if item is Int {
                return CGSize(width: collectionView.frame.size.width, height: 70)
            } else {
                return CGSize(width: collectionView.frame.size.width, height: 190)
            }
    }

    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        topRefreshControl.scrollTableView()
        
//        var progress = scrollView.contentOffset.y / (scrollView.contentSize.height - scrollView.bounds.size.height)
//        print(String(progress))
        
    }

}
