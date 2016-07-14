//
//  OrganizerViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/3/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class OrganizerViewController: UITableViewController {

    let headerTitles = ["UPCOMING EVENTS", "NEWS FEED"]
    var upcomingEvents : [Activity]?
    var notifications : [Notification]?
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Segues.showOrganizerEvent {
            guard let vc = segue.destinationViewController as? EventViewController else { return }
            vc.parentNavColor = Colors.primaryBlue
        }
    }
    
    // MARK: Setup View's Layout
    
    func visualize() {
        tableView?.addInvisibleHeader(Colors.darkBlue, sender: self.tableView, size: 150)
    }

    
    // MARK: Tableview Functions
    
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
            return 70
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        header.backgroundColor = Colors.darkBlue
        
        let headerLabel = UILabel(frame: CGRectMake(12, 3, 150, 35))
        headerLabel.font = UIFont(name: "Roboto-Medium", size: 12)
        headerLabel.textColor = .whiteColor()
        headerLabel.textAlignment = .Left
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        
        header.addSubview(headerLabel)
        
        header.addShadow(0.4, radius: 2.5)
//        header.layer.shadowColor = UIColor.blackColor().CGColor
//        header.layer.shadowOpacity = 0.4
//        header.layer.shadowOffset = CGSizeZero
//        header.layer.shadowRadius = 2.5
        
        return header
    }
    
}
