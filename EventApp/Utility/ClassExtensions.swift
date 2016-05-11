//
//  ClassExtensions.swift
//  EventApp
//
//  Created by Michael Darche on 4/25/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().alpha = 0.85
    }
    
}

extension UIImageView{
    func blurImage()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}

extension UITableViewController {
    
    func setTableViewBackgroundGradient(sender: UITableViewController) {
        
        let gradientBackgroundColors = [UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0).CGColor, UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0).CGColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations
        
        let blackLayer = UIView(frame: sender.tableView.bounds)
        blackLayer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.64)
        
        gradientLayer.frame = sender.tableView.bounds
        let backgroundView = UIView(frame: sender.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, atIndex: 0)
        backgroundView.addSubview(blackLayer)
        sender.tableView.backgroundView = backgroundView
    }
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableWidth: CGFloat = tableView.bounds.size.width
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(tableWidth, 0)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
}

extension UICollectionViewController {
    
    func setEventViewBackgroundGradient(sender: UICollectionViewController, image: UIImage?) {
        
        let gradientBackgroundColors = [UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 0.6).CGColor, UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 0.6).CGColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations
        
        let imageLayer = UIImageView(frame: sender.collectionView!.bounds)
        imageLayer.image = image
        imageLayer.layer.masksToBounds = true
        imageLayer.contentMode = .ScaleAspectFill
        imageLayer.blurImage()
        
        gradientLayer.frame = sender.collectionView!.bounds
//        let backgroundView = UIView(frame: sender.collectionView!.bounds)
//        backgroundView.addSubview(imageLayer)
        imageLayer.layer.insertSublayer(gradientLayer, atIndex: 0)
        sender.collectionView!.backgroundView = imageLayer
    }
    
}
