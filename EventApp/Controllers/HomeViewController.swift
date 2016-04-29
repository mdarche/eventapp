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
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var createEventConstraint: NSLayoutConstraint!
    let gradient = CAGradientLayer()
    
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
    
    @IBAction func dismissNotification(sender: UIButton) {
        UIView.animateWithDuration(0.3, animations: {
            self.eventNotification.transform = CGAffineTransformMakeTranslation(0, 58)
            self.createEventButton.transform = CGAffineTransformMakeTranslation(0, 48)
            }, completion: { (finished:Bool) in
                self.eventNotification.hidden = true
        })
    }
    
    func categoriesPressed() {
        
        // TODO
        
    }
    
    func visualize() {
        createEventButton.layer.cornerRadius = createEventButton.frame.size.width/2
        notificationImage.layer.cornerRadius = notificationImage.frame.size.width/2
        notificationImage.layer.borderColor = UIColor.whiteColor().CGColor
        notificationImage.layer.borderWidth = 1
        
        self.segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
        self.segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Selected)
        
        outerView.layer.cornerRadius = CGRectGetHeight(outerView.bounds) / 2
        outerView.layer.borderColor = UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0).CGColor
        outerView.layer.borderWidth = 1
        
        gradient.colors = [UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0).CGColor, UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0).CGColor]
        gradient.frame = listContainer.bounds
        gradient.locations = [0.0, 1.0]
        listContainer.layer.insertSublayer(gradient, atIndex: 0)
    }

}
