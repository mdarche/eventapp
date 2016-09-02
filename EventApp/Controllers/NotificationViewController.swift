//
//  NotificationViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/3/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class NotificationViewController: UITableViewController {

    let headerTitles = ["SAVED ACTIVITIES", "NEWS FEED"]
    var upcomingEvents: [Activity]?
    var notifications: [Notification]?
    
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.hidden = false
    }
    
    
    // MARK: - View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Segues.showOrganizerEvent {
            guard let vc = segue.destinationViewController as? EventViewController else { return }
            vc.parentNavColor = Colors.primaryBlue
        }
    }
    
    
    // MARK: - Setup View's Layout
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden ?? false
    }
    
    func visualize() {
        tableView!.addInvisibleHeader(Colors.darkestBlue, sender: self.tableView!, size: 260)
    }
    

    
    // MARK: - Tableview Functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: return count of each object array per section
        if section == 0 {
            return 2
        } else {
            return 20
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell1 = tableView.dequeueReusableCellWithIdentifier(Identifiers.organizerNewsCell) as? OrganizerNewsCell,
            cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.organizerUpcomingCell) as? OrganizerUpcomingCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            //TODO: Set upcoming event cell data
            
            return cell
        } else {
            //TODO: set notification cell data
            
           return cell1
        }

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            performSegueWithIdentifier(Segues.showOrganizerEvent, sender: indexPath)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 112
        } else {
            return 60
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = Utility.createTableHeader(UIColor.whiteColor(), bottomBorder: true, tableView: self.tableView)

        let headerLabel = Utility.createHeaderLabel(Colors.labelBlack)
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        header.addSubview(headerLabel)
        
        return header
    }
    
}
