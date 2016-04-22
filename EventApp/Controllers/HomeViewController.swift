//
//  HomeViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var listContainer: UIView!
    @IBOutlet weak var mapContainer: UIView!
    @IBOutlet weak var eventNotification: UIView!
    @IBOutlet weak var createEventButton: UIButton!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.2, animations: {
                self.mapContainer.alpha = 1
                self.createEventButton.alpha = 1
                self.listContainer.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.mapContainer.alpha = 0
                self.createEventButton.alpha = 0
                self.listContainer.alpha = 1
            })
        }
    }
    
    func visualize() {
        createEventButton.layer.cornerRadius = createEventButton.frame.size.width/2
        createEventButton.layer.masksToBounds = true
    }

}
