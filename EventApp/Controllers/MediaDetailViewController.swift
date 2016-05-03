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
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MediaDetailViewController.dismissVC))
        downSwipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(downSwipe)
        
    }

    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        dismissVC()
        UIApplication.sharedApplication().statusBarHidden = false
    }
    
    @IBAction func exitButtonPressed(sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
