//
//  UserTableViewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/9/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    var users : [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if users != nil {
            return users!.count
        } else {
            return 0
        }
    }

    // MARK: Dismiss modal view
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let topOffset: CGFloat = -105
        let currentOffset = scrollView.contentOffset.y
        
        if currentOffset < topOffset {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}
