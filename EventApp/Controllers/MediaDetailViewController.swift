//
//  MediaDetailViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class MediaDetailViewController: UIViewController {

    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MediaDetailViewController.dismissVC))
        downSwipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(downSwipe)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        dismissVC()
    }
    
    override func  preferredStatusBarStyle()-> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func exitButtonPressed(sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC() {
        dismissViewControllerAnimated(true, completion: {
            UIApplication.sharedApplication().statusBarHidden = false
            self.tabBarController?.tabBar.hidden = false
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
