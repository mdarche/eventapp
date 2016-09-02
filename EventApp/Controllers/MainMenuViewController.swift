//
//  MainMenuViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController {

    @IBOutlet weak var accentLineA: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tableHeader: UIView!
    @IBOutlet weak var progressView: ProgressView!
    
    private let headerTitles = ["PROFILE / SETTINGS", "MORE"]
    
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    // MARK: - View's Transition Handler
    
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
    
    
    // MARK: - Class Functions
    
    func visualize() {
        progressView.animateProgressView()
        tableView?.addInvisibleHeader(Colors.darkestBlue, sender: self.tableView, size: 260)
        logoutButton.layer.cornerRadius = logoutButton.frame.size.height/2
        logoutButton.addShadow(0.3, radius: 2)
        
        UIView.animateWithDuration(1.2, animations: {
            self.accentLineA.backgroundColor = UIColor(white: 1, alpha: 0.1)
        })
    }
    
    func showInviteAlert() {
        let alertController = UIAlertController(title: "Invite Your Friends", message: nil, preferredStyle: .ActionSheet)
        let buttonFacebook = UIAlertAction(title: "Facebook", style: .Default, handler: { (action) -> Void in
            self.performSegueWithIdentifier(Segues.showInviteTable, sender: self)
        })
        let buttonSMS = UIAlertAction(title: "Text Message", style: .Default) { (action) -> Void in }
        let buttonCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in }
        
        alertController.view.tintColor = Colors.primaryBlue
        alertController.addAction(buttonFacebook)
        alertController.addAction(buttonSMS)
        alertController.addAction(buttonCancel)
        presentViewController(alertController, animated: true, completion: nil)
    }
}


extension MainMenuViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 2
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 3 {
            showInviteAlert()
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = Utility.createTableHeader(Colors.primaryGray, bottomBorder: false, tableView: self.tableView)
        
        let headerLabel = Utility.createHeaderLabel(Colors.labelBlack)
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        header.addSubview(headerLabel)
        
        return header

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
