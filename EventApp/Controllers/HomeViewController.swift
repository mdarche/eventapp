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
                self.navigationController?.navigationBar.barTintColor = Colors.darkestBlue
                self.mapContainer.alpha = 1
                self.listContainer.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.navigationController?.navigationBar.barTintColor = Colors.primaryBlue
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
    
    func visualize() {
        eventNotification.hidden = true
        notificationImage.layer.cornerRadius = notificationImage.frame.size.width/2
        notificationImage.layer.borderColor = UIColor.whiteColor().CGColor
        notificationImage.layer.borderWidth = 1
        
        segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
        segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Selected)
        
        outerView.layer.cornerRadius = CGRectGetHeight(outerView.bounds) / 2
        outerView.layer.borderColor = Colors.primaryBlue.CGColor
        outerView.layer.borderWidth = 1
        
//        let moreButton = UIBarButtonItem(image: UIImage(named: "more"), style: .Plain, target: self, action: #selector(HomeViewController.moreMenuPressed))
//        self.navigationItem.rightBarButtonItem = moreButton
    }
    
    func moreMenuPressed() {
        
    }

}
