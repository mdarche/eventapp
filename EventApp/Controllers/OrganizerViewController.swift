//
//  OrganizerViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/3/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class OrganizerViewController: UITableViewController {

    let headerTitles = ["My Events", "News Feed"]
    
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
        animateTable()
        setTableViewBackgroundGradient(self)
    }

    
    // MARK: Tableview Functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: return count of each object array per section
        
        return 4
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
        header.backgroundColor = UIColor(red: 10/255, green: 11/255, blue: 15/255, alpha: 1.0)
        
        let headerLabel = UILabel(frame: CGRectMake(12, 3, 100, 35))
        headerLabel.font = UIFont(name: "Roboto-Regular", size: 15)
        headerLabel.textColor = UIColor.whiteColor()
        headerLabel.textAlignment = .Left
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        
        header.addSubview(headerLabel)
        
        return header
    }
    
}
