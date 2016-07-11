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
            guard let vc = segue.destinationViewController as? ProfileViewController else { return }
            vc.isMe = true
        }
        
        if segue.identifier == Segues.showPrivacyPolicy {
            guard let vc = segue.destinationViewController as? PrivacyTermsViewController else { return }
                vc.isPrivacy = true
        }

        if segue.identifier == Segues.showInviteTable {
            guard let vc = segue.destinationViewController as? FFITableviewController else { return }
            vc.isInvitation = true
        }
    }
    
    
    
    // MARK: Setup View's Layout
    
    func visualize() {
        tableView?.addInvisibleHeader(Colors.darkestBlue, sender: self.tableView, size: 260)
//        let topView: UIView = UIView(frame: CGRectMake(0.0, -260.0, UIScreen.mainScreen().bounds.width, 260.0))
//        topView.backgroundColor = UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0)
//        tableView?.addSubview(topView)
    }
    
    
    // MARK: Tableview setup
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
