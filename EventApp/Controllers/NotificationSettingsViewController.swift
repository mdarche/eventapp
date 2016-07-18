//
//  NotificationSettingsViewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/17/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class NotificationSettingsViewController: UITableViewController {

    @IBOutlet weak var nearbyEventSwitch: UISwitch!
    @IBOutlet weak var eventReminderSwitch: UISwitch!
    @IBOutlet weak var newFollowerSwitch: UISwitch!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    func visualize() {
        tableView?.addInvisibleHeader(.whiteColor(), sender: self.tableView, size: 50)
        headerView.layer.shadowColor = UIColor.blackColor().CGColor
        saveButton.layer.cornerRadius = saveButton.frame.size.height/2
    }
    
    
    @IBAction func saveChanges(sender: AnyObject) {
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
