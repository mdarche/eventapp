//
//  OrganizerViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/3/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class OrganizerViewController: UITableViewController {

    let headerTitles = ["Upcoming", "Invitations"]
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    // MARK: Setup View's Layout
    
    func visualize() {
        setTableViewBackgroundGradient(self)
    }

    
    // MARK: Tableview Functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.organizerCell) as? OrganizerFeedCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            performSegueWithIdentifier(Segues.showEvent, sender: indexPath)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        //Create label and autoresize it
//        let headerLabel = UILabel(frame: CGRectMake(0, 0, tableView.frame.width, 2000))
//        //        headerLabel.font = UIFont(name: "Avenir-Light", size: 30)
//        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        
//        //Adding Label to existing headerView
//        let headerView = UIView()
//        headerView.addSubview(headerLabel)
//        
//        return headerView
//    }
    
}
