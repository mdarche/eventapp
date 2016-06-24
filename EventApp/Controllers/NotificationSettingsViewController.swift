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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Colors.mainBlueFull
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        UIView.animateWithDuration(0.3, animations: {
            self.navigationController?.navigationBar.barTintColor = Colors.mainDarkFull
        })
    }
    
    @IBAction func saveChanges(sender: AnyObject) {
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
