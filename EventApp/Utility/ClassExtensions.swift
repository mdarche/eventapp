//
//  ClassExtensions.swift
//  EventApp
//
//  Created by Michael Darche on 4/25/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import MapKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().alpha = 0.85
    }
}

class Utility : NSObject {
    
    class func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}

extension UIImageView{
    func blurImage(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
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
        
        gradientLayer.frame = sender.tableView.bounds
        let backgroundView = UIView(frame: sender.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        sender.tableView.backgroundView = backgroundView
    }
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(0.7, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
}

extension UICollectionViewController {
    
    func setBackgroundGradient(sender: UICollectionViewController, image: UIImage?) {

        let imageLayer = UIImageView(frame: sender.collectionView!.bounds)
        if image != nil {
            imageLayer.image = image
            imageLayer.layer.masksToBounds = true
            imageLayer.contentMode = .ScaleAspectFill
            imageLayer.blurImage()
        }
        sender.collectionView!.backgroundView = imageLayer
    }
    
}

extension UIView {
    func pushTransition(duration:CFTimeInterval, effect: String?) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        
        if effect == "fade" {
            animation.type = kCATransitionFade
            animation.subtype = kCATransitionFade
        } else {
            animation.type = kCATransitionFromBottom
            animation.subtype = kCATransitionFromBottom
        }
        
        animation.duration = duration
        self.layer.addAnimation(animation, forKey: kCATransitionPush)
    }
}

extension MKAnnotationView {
    func createCurrentUserLocation(pulseView: MKAnnotationView) {
        pulseView.centerOffset = CGPoint(x: 50, y: -30)
        
        let subview1 = UIView()
        let pulsator = Pulsator()
        pulsator.backgroundColor = Colors.mainBlueHalf.CGColor
        pulsator.numPulse = 6
        pulsator.animationDuration = 12
        pulsator.repeatCount = 5
        pulsator.radius = 200.0
        pulsator.start()
        subview1.layer.addSublayer(pulsator)
        subview1.frame.offsetInPlace(dx: 15, dy: 15)
        
        let subview2 = UIImageView(image: UIImage(named: "userLocation"))
        subview2.frame = CGRectMake(0, 0, 30, 30)
        subview2.contentMode = .ScaleAspectFit
        
        pulseView.addSubview(subview2)
        pulseView.insertSubview(subview1, belowSubview: subview2)
        
    }
    
}

extension UIImageView {
    
    func addDarkGradientLayer(imageView: UIImageView) {
        let gradientLayer = CAGradientLayer()
        let gradientColors = [UIColor.clearColor().CGColor, UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 0.4).CGColor ]
        let gradientLocations = [0.0, 1.0]
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = imageView.frame
        
        imageView.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
}

extension NSDate {
    func yearsFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
    }
    func monthsFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
    }
    func weeksFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
    }
    func daysFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
    }
    func hoursFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
    }
    func minutesFrom(date: NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
    }
    func secondsFrom(date: NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
    }
    func offsetFrom(date: NSDate) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
        return ""
    }
}


