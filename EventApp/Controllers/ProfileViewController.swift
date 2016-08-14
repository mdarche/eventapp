//
//  ProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ToggleGridLayoutDelegate {
    
    
    private var topRefreshControl = TopRefresher()
    var profileId : Int?
    var user : User?
    var isMe : Bool?
    
    var headerLabel : UILabel?
    var animatedNavbar : UIView?
    var statusBarBG : UIView?
    
    var isListLayout = true
    let listLayout = ListLayout()
    let gridLayout = GridLayout()
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        setNavAnimation()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        collectionView?.contentOffset.y = 0
        animatedNavbar?.removeFromSuperview()
        statusBarBG?.removeFromSuperview()
        removeNavBar(nil, yes: false)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
    }
    // MARK: View's Transition Handler
    
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
    
    
    // MARK: LayoutSwitch Delegate Method
    
    func switchOn(bool: Bool) {
        
        if bool == true {
            if !isListLayout {
                isListLayout = true
                collectionView?.collectionViewLayout.invalidateLayout()
                collectionView?.setCollectionViewLayout(self.listLayout, animated: false)
                collectionView?.reloadData()
            }
        } else {
            if isListLayout {
                isListLayout = false
                collectionView?.collectionViewLayout.invalidateLayout()
                collectionView?.setCollectionViewLayout(self.gridLayout, animated: false)
                collectionView?.reloadData()
            }
        }
        
    }
    
    // MARK: Class Functions
    
    func visualize() {
        
        collectionView!.collectionViewLayout = listLayout
        
        let headerNib = UINib(nibName: "ProfileSwitchHeader", bundle: nil)
        collectionView?.registerNib(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        if isMe == true {
            let settingsButton = UIBarButtonItem(image: UIImage(named: "settingsLight"), style: .Plain, target: self, action: #selector(ProfileViewController.settingsPressed))
            self.navigationItem.rightBarButtonItem = settingsButton
        }
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = false
        
        collectionView?.frame = CGRectMake(0, -64, self.view.frame.width, self.view.frame.height+64)
        collectionView!.addInvisibleHeader(Colors.accentRed, sender: self.collectionView!, size: 100)
        topRefreshControl.setupSubview(.clearColor(), bgColor: Colors.accentRed)
        topRefreshControl.addTarget(self, action: #selector(ProfileViewController.handleTopPull), forControlEvents: UIControlEvents.ValueChanged)
        collectionView!.addSubview(topRefreshControl)
        
    }
    
    func setNavAnimation() {

        statusBarBG = UIView(frame: CGRectMake(0, -UIApplication.sharedApplication().statusBarFrame.height, (navigationController?.navigationBar.frame.width)!, UIApplication.sharedApplication().statusBarFrame.height))
        statusBarBG!.backgroundColor = Colors.darkestBlue
        navigationController?.navigationBar.addSubview(statusBarBG!)
        navigationController?.navigationBar.sendSubviewToBack(statusBarBG!)
        
        animatedNavbar = UIView(frame: CGRectMake(0, -UIApplication.sharedApplication().statusBarFrame.height - 64, (navigationController?.navigationBar.frame.width)!, 64))
        animatedNavbar?.clipsToBounds = true
        animatedNavbar?.backgroundColor = Colors.darkestBlue
        navigationController?.navigationBar.addSubview(animatedNavbar!)
        navigationController?.navigationBar.sendSubviewToBack(animatedNavbar!)
        animatedNavbar?.userInteractionEnabled = false
        
        
        headerLabel = UILabel(frame: CGRectMake(0, 48, navigationController!.navigationBar.frame.width, navigationController!.navigationBar.frame.height))
        headerLabel?.font = UIFont(name: "Roboto-Regular", size: 15)
        headerLabel?.text = "username"
        headerLabel?.textAlignment = .Center
        headerLabel?.textColor = UIColor.whiteColor()

        animatedNavbar?.addSubview(headerLabel!)
        
        removeNavBar(UIImage(), yes: true)
        
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


extension ProfileViewController {
    
    // MARK: UICollectionViewDataSource
    
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
        } else {
            animatedNavbar?.frame = CGRectMake(0, -UIApplication.sharedApplication().statusBarFrame.height, (navigationController?.navigationBar.frame.width)!, 64)
        }
        
        let labelTransform = CATransform3DMakeTranslation(0, max(-30, 90 - offset), 0)
        headerLabel!.layer.transform = labelTransform
        
    }
    
}
