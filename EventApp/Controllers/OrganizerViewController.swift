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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    // MARK: Setup View's Layout
    
    func visualize() {
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
        header.backgroundColor = UIColor(red: 225/255, green: 228/255, blue: 234/255, alpha: 1.0)
        
        let headerLabel = UILabel(frame: CGRectMake(12, 3, 150, 35))
        headerLabel.font = UIFont(name: "Roboto-Medium", size: 12)
        headerLabel.textColor = UIColor(red: 150/255, green: 152/255, blue: 156/255, alpha: 1.0)
        headerLabel.textAlignment = .Left
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        
        header.addSubview(headerLabel)
        
        header.layer.shadowColor = UIColor.blackColor().CGColor
        header.layer.shadowOpacity = 0.4
        header.layer.shadowOffset = CGSizeZero
        header.layer.shadowRadius = 2.5
        
        return header
    }
    
}
