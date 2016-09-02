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
        UITabBar.appearance().tintColor = .whiteColor()
        UITabBar.appearance().alpha = 1
    }
}


// MARK: - UIImageViews and UIViews

extension UIImageView{
    
    func blurImage(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(blurEffectView)
    }
    
    // For Profiles
    
    func addCoverImageGradient() {
        let gradientLayer = CAGradientLayer()
        let gradientColors = [ UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 0.85).CGColor, UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 0.68).CGColor, UIColor.clearColor().CGColor ]
        let gradientLocations = [0.0, 0.5, 1.0]
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, atIndex: 0)
        
    }
    
    // For cells
    
    func addDarkGradientLayer() {
        let gradientLayer = CAGradientLayer()
        let gradientColors = [UIColor.clearColor().CGColor, UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 0.6).CGColor ]
        let gradientLocations = [0.3, 1.0]
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.frame
        
        self.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
}

extension UIView {
    func pushTransition(duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        animation.type = kCATransitionFade
        animation.subtype = kCATransitionFade
        animation.duration = duration
        self.layer.addAnimation(animation, forKey: kCATransitionPush)
    }
    
    func addShadow(opacity: Float, radius: CGFloat) {
        // Recommended 2 for radius and 0.8 for opacity
        
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = radius
    }
    
    
}


// MARK: - UITableViews

extension UITableView {
    
    func addInvisibleHeader(color: UIColor, sender: UITableView, size: CGFloat) {
        let topView: UIView = UIView(frame: CGRect(x: 0.0, y: -size, width: UIScreen.mainScreen().bounds.width, height: size))
        topView.backgroundColor = color
        sender.addSubview(topView)
    }
}

extension UITableViewController {
    
    
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

extension UICollectionView {
    
    func addInvisibleHeader(color: UIColor, sender: UICollectionView, size: CGFloat) {
        let topView: UIView = UIView(frame: CGRect(x: 0.0, y: -size, width: UIScreen.mainScreen().bounds.width, height: size))
        topView.backgroundColor = color
        sender.addSubview(topView)
    }
}


// MARK: - Mapkit extensions

extension MKAnnotationView {
    func createCurrentUserLocation(pulseView: MKAnnotationView) {
        pulseView.centerOffset = CGPoint(x: 50, y: -30)
        
        let subview1 = UIView()
        let pulsator = Pulsator()
        pulsator.backgroundColor = Colors.darkBlueHalf.CGColor
        pulsator.numPulse = 6
        pulsator.animationDuration = 12
        pulsator.repeatCount = 5
        pulsator.radius = 200.0
        pulsator.start()
        subview1.layer.addSublayer(pulsator)
        subview1.frame.offsetInPlace(dx: 15, dy: 15)
        
        let subview2 = UIImageView(image: UIImage(named: "userLocation"))
        subview2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        subview2.contentMode = .ScaleAspectFit
        
        pulseView.addSubview(subview2)
        pulseView.insertSubview(subview1, belowSubview: subview2)
        
    }
    
}


// MARK: - NSDate Dateformatters

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

// MARK: - UIDevice lookup

public enum Model: String {
    case simulator = "simulator/sandbox",
    iPod1          = "iPod 1",
    iPod2          = "iPod 2",
    iPod3          = "iPod 3",
    iPod4          = "iPod 4",
    iPod5          = "iPod 5",
    iPad2          = "iPad 2",
    iPad3          = "iPad 3",
    iPad4          = "iPad 4",
    iPhone4        = "iPhone 4",
    iPhone4S       = "iPhone 4S",
    iPhone5        = "iPhone 5",
    iPhone5S       = "iPhone 5S",
    iPhone5C       = "iPhone 5C",
    iPadMini1      = "iPad Mini 1",
    iPadMini2      = "iPad Mini 2",
    iPadMini3      = "iPad Mini 3",
    iPadAir1       = "iPad Air 1",
    iPadAir2       = "iPad Air 2",
    iPhone6        = "iPhone 6",
    iPhone6plus    = "iPhone 6 Plus",
    iPhone6S       = "iPhone 6S",
    iPhone6Splus   = "iPhone 6S Plus",
    unrecognized   = "?unrecognized?"
}

public extension UIDevice {
    public var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafeMutablePointer(&systemInfo.machine) {
            ptr in String.fromCString(UnsafePointer<CChar>(ptr))
        }
        var modelMap: [ String: Model ] = [
            "i386"     : .simulator,
            "x86_64"   : .simulator,
            "iPod1,1"  : .iPod1,
            "iPod2,1"  : .iPod2,
            "iPod3,1"  : .iPod3,
            "iPod4,1"  : .iPod4,
            "iPod5,1"  : .iPod5,
            "iPad2,1"  : .iPad2,
            "iPad2,2"  : .iPad2,
            "iPad2,3"  : .iPad2,
            "iPad2,4"  : .iPad2,
            "iPad2,5"  : .iPadMini1,
            "iPad2,6"  : .iPadMini1,
            "iPad2,7"  : .iPadMini1,
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPad3,1"  : .iPad3,
            "iPad3,2"  : .iPad3,
            "iPad3,3"  : .iPad3,
            "iPad3,4"  : .iPad4,
            "iPad3,5"  : .iPad4,
            "iPad3,6"  : .iPad4,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPad4,1"  : .iPadAir1,
            "iPad4,2"  : .iPadAir2,
            "iPad4,4"  : .iPadMini2,
            "iPad4,5"  : .iPadMini2,
            "iPad4,6"  : .iPadMini2,
            "iPad4,7"  : .iPadMini3,
            "iPad4,8"  : .iPadMini3,
            "iPad4,9"  : .iPadMini3,
            "iPhone7,1": .iPhone6plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6Splus
        ]
        
        if let model = modelMap[String.fromCString(modelCode!)!] {
            return model
        }
        return Model.unrecognized
    }
}


