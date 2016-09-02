//
//  ProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController {
    
    
    var profileId: Int?
    var user: User?
    var isMe: Bool?
    
    var isListLayout = true
    let listLayout = ListLayout()
    let gridLayout = GridLayout()
    
    private var headerLabel: UILabel?
    private var animatedNavbar: UIView?
    private var statusBarBG: UIView?
    private var topRefreshControl = TopRefresher()

    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        setNavAnimation()
        collectionView?.delegate = self
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        collectionView?.contentOffset.y = -50
        animatedNavbar?.removeFromSuperview()
        statusBarBG?.removeFromSuperview()
        removeNavBar(nil, yes: false)
        collectionView?.delegate = nil
        
    }
    
    
    // MARK: - View's Transition Handler
    
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
    
 
    // MARK: - Class Functions
    
    func visualize() {
        
        collectionView!.collectionViewLayout = listLayout
        collectionView?.frame = CGRect(x: 0, y: -navigationController!.navigationBar.frame.height, width: self.view.frame.width, height: self.view.frame.height+64)
        collectionView!.addInvisibleHeader(Colors.primaryBlue, sender: self.collectionView!, size: 100)
        
        let headerNib = UINib(nibName: "ProfileSwitchHeader", bundle: nil)
        collectionView?.registerNib(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        if isMe == true {
            let settingsButton = UIBarButtonItem(image: UIImage(named: "settingsLight"), style: .Plain, target: self, action: #selector(ProfileViewController.settingsPressed))
            self.navigationItem.rightBarButtonItem = settingsButton
        }
        
        topRefreshControl.setupSubview(.clearColor(), bgColor: Colors.primaryBlue)
        topRefreshControl.addTarget(self, action: #selector(ProfileViewController.handleTopPull), forControlEvents: UIControlEvents.ValueChanged)
        collectionView!.addSubview(topRefreshControl)
        
    }
    
    func setNavAnimation() {

        removeNavBar(UIImage(), yes: true)

        statusBarBG = Utility.addStatusBarBG(navigationController!)
        animatedNavbar = Utility.createCustomNav(navigationController!)
        headerLabel = Utility.createCustomNavHeader(navigationController!, text: "username")

        animatedNavbar?.addSubview(headerLabel!)
    }
    
    func removeNavBar(image: UIImage?, yes: Bool) {
        navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = image
        navigationController?.navigationBar.translucent = yes
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


extension ProfileViewController: ToggleGridLayoutDelegate {
    
    func switchOn(bool: Bool) {
        if bool == true {
            if (!isListLayout) {
                isListLayout = true
                collectionView?.collectionViewLayout.invalidateLayout()
                collectionView?.setCollectionViewLayout(self.listLayout, animated: false)
                collectionView?.reloadData()
            }
        } else {
            if (isListLayout) {
                isListLayout = false
                collectionView?.collectionViewLayout.invalidateLayout()
                collectionView?.setCollectionViewLayout(self.gridLayout, animated: false)
                collectionView?.reloadData()
            }
        }
    }
}


extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        } else {
            return 12
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let mediaCell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileMediaCell, forIndexPath: indexPath) as! ProfileMediaCell
        let activityCell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.profileActivityCell, forIndexPath: indexPath) as! ProfileActivityCell
        
        if isListLayout {
            return activityCell
        } else {
            return mediaCell
        }
    
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Tapped")
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                                 atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                withReuseIdentifier: Identifiers.profileHeader,forIndexPath: indexPath) as! ProfileHeader
            return header
        } else {
            let headerSwitch = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                withReuseIdentifier: "header", forIndexPath: indexPath) as! ProfileSwitchHeader
            headerSwitch.delegate = self
            return headerSwitch
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {        
        if section == 0 {
            return CGSizeMake(CGRectGetWidth(collectionView.bounds), 426.0)
        } else {
            return CGSizeMake(CGRectGetWidth(collectionView.bounds), 45.0)
        }
    }
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        topRefreshControl.scrollTableView()
        
        let offset = scrollView.contentOffset.y
        
        if offset <= 64 {
            let navBarTransform = CATransform3DMakeTranslation(0, max(-64, offset), 0)
            animatedNavbar?.layer.transform = navBarTransform
        } else if offset > 65 {
            animatedNavbar?.frame = CGRect(x: 0, y: -UIApplication.sharedApplication().statusBarFrame.height,width: (navigationController?.navigationBar.frame.width)!, height: 64)
        }
        
        let labelTransform = CATransform3DMakeTranslation(0, max(-30, 90 - offset), 0)
        headerLabel!.layer.transform = labelTransform
        
    }
    
}
