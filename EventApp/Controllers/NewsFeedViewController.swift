//
//  NewsFeedViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var collectionViewContainer: UIView!
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        
    }
    
    func visualize() {
        
        gradient.colors = [UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0).CGColor, UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0).CGColor]
        gradient.frame = collectionViewContainer.bounds
        gradient.locations = [0.0, 1.0]
        collectionViewContainer.layer.insertSublayer(gradient, atIndex: 0)
    }
}
