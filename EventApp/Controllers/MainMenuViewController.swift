//
//  MainMenuViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tableHeader: UIView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
    var hideCells = false
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        searchBar.text = nil
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
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        animateViews(0.0, hide: true)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        searchBar.endEditing(true)
        animateViews(1.0, hide: false)
    }
    
    
    // MARK: Setup View's Layout
    
    func visualize() {
        searchBar.delegate = self
        self.searchBar.keyboardAppearance = UIKeyboardAppearance.Dark
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        animateTable()
        setTableViewBackgroundGradient(self)
        logoutButton.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).CGColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.dismissKeyboard))
        tableHeader.addGestureRecognizer(tap)
    }
    
    func animateViews(alpha: CGFloat, hide: Bool) {
        if hide == true { logoutButton.alpha = alpha }
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.profileImage.alpha = alpha
            self.hideCells = hide
            self.tableView.reloadData()
            if hide == false { self.logoutButton.alpha = alpha}
        }, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hideCells == false {
            return 4
        } else {
            return 0
        }
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
        if indexPath == 0 {
            performSegueWithIdentifier(Segues.showProfile, sender: self)
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
