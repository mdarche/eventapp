//
//  MainMenuViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tableHeader: UIView!
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Segues.showProfile {
            guard let vc = segue.destinationViewController as? ProfileViewController else {
                return
            }
            vc.isMe = true
        }
    }
    
    
    
    // MARK: Setup View's Layout
    
    func visualize() {
        animateTable()
        setTableViewBackgroundGradient(self)
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell  = tableView.cellForRowAtIndexPath(indexPath)
        cell!.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.34)
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell  = tableView.cellForRowAtIndexPath(indexPath)
        cell!.contentView.backgroundColor = .clearColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath {
        case 0:
            performSegueWithIdentifier(Segues.showProfile, sender: self)
//        case 1:
//            // Segue to edit profile
//        case 2:
//            // Segue to Follower/Following/Invite User table
//        case 3:
//            // Segue to Notification Settings
//        case 4:
//            // Segue to Terms webview
//        case 5:
//            //Segue to Privacy webview
        default: break
        }
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        
        let facebookLogout = FBSDKLoginManager()
        facebookLogout.logOut()
        
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() {
            self.presentViewController(controller, animated: true, completion: { () -> Void in
                self.view.window?.rootViewController = controller
            })
        }
    }
    
    
}
