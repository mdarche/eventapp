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
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var createEventConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var outerView: UIView!
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.2, animations: {
                self.mapContainer.alpha = 1
                self.listContainer.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.mapContainer.alpha = 0
                self.listContainer.alpha = 1
            })
        }
    }
    
    @IBAction func dismissNotification(sender: UIButton) {
        UIView.animateWithDuration(0.2, animations: {
            self.eventNotification.transform = CGAffineTransformMakeTranslation(0, 58)
            }, completion: { (finished:Bool) in
                self.eventNotification.hidden = true
        })
    }
    
    func categoriesPressed() {
        
        // TODO
        
    }
    
    func visualize() {
        notificationImage.layer.cornerRadius = notificationImage.frame.size.width/2
        notificationImage.layer.borderColor = UIColor.whiteColor().CGColor
        notificationImage.layer.borderWidth = 1
        
        segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
        segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Selected)
        
        outerView.layer.cornerRadius = CGRectGetHeight(outerView.bounds) / 2
        outerView.layer.borderColor = UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0).CGColor
        outerView.layer.borderWidth = 1
        
    }

}
