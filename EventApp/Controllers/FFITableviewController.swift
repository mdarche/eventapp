//
//  FFITableviewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/17/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import Haneke

class FFITableviewController: UITableViewController {

    var isFollowers : Bool?
    var isFollowing : Bool?
    var isInvitation : Bool?
    
    var users = [User]()
    var profileId : Int?
    
    private var limit = 20
    private var skip = 0
    private var downloadControl = false
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
//        downloadData(limit, skip: skip)
    }
    
    // MARK: Setup View
    
    
    func visualize() {
        if isFollowers != nil {
            navigationItem.title = "Followers"
        } else if isFollowing != nil {
            navigationItem.title = "Following"
        } else if isInvitation != nil {
            navigationItem.title = "Invite Users"
        }
    }
    
    func downloadData(limit: Int, skip: Int) {
        if isFollowers != nil {
            self.downloadControl = true
            Requests.getProfileFollowers([profileId!, limit, skip]) { (followers, successful, error) in
                if successful {
                    for f in followers! {
                        self.users.append(f)
                    }
                    self.skip += 20
                    self.tableView.reloadData()
                    self.downloadControl = false
                } else {
                    self.downloadControl = true
                }
            }
        }
        
        if isFollowing != nil {
            self.downloadControl = true
            Requests.getProfileFollowing([profileId!, limit, skip]) { (following, successful, error) in
                if successful {
                    for f in following! {
                        self.users.append(f)
                    }
                    self.skip += 20
                    self.tableView.reloadData()
                    self.downloadControl = false
                } else {
                    self.downloadControl = true
                }
            }
        }
        

    }
    
    
    // MARK: Follow and Invite Functions
    
}


extension FFITableviewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if users.count > 0 {
            return users.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.followInviteCell, forIndexPath: indexPath) as? FFITableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.imageThumbnail.hnk_setImageFromURL(user.profileImage!)
        cell.nameLabel.text = user.displayName
        
        //TODO: Configure Following button
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if isFollowers != nil || isFollowing != nil {
            let selectedUser = users[indexPath.row]
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserProfileViewController") as! ProfileViewController
            
            vc.profileId = selectedUser.profileId
            vc.profileImage = selectedUser.profileImage
            vc.displayName = selectedUser.displayName
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        UIApplication.sharedApplication().statusBarHidden = false
//        
//        let currentOffset = scrollView.contentOffset.y
//        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
//        
//        if (maximumOffset - currentOffset) <= 500 {
//            if downloadControl == false {
//                downloadData(limit, skip: skip)
//            }
//        }
//    }
    
}
