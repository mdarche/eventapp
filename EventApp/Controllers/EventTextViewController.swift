//
//  EventTextViewController.swift
//  EventApp
//
//  Created by Michael Darche on 7/13/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EventTextViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func dismissPresed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func visualize() {
        containerView.addShadow(0.4, radius: 2)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
