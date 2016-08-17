//
//  LoginViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var appNameLabel: UILabel!
    @IBOutlet weak var facebookLoginButton: UIButton!

    var imageViews = [UIImageView]()
    var colorView = UIView()
    var deviceName = String(UIDevice.currentDevice().type)
    var deviceOS = UIDevice.currentDevice().systemVersion
    
    var backgrounds:[UIImage?] = [UIImage(named: "beachPartyDark"), UIImage(named: "login2"), UIImage(named:"login1")]
    var strings = ["Find the most current activities near you, no matter where you are", "Explore the nightlife of a new city", "Get directions, venue ratings, and event information in real time"]
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    
    // MARK: Set Up Scrollview and Paging
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func visualize() {
        onboardLabel.text = strings[0]
        scrollView.delegate = self
    
        
        scrollView.frame = CGRectMake(0, 0, (self.view.frame.width + 3), self.view.frame.height)
        var frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewHeight = self.scrollView.frame.height
        let scrollViewWidth = self.scrollView.frame.width
        
        for index in 0..<3 {
            
            frame.origin.x = scrollViewWidth * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            let subView = UIImageView(frame: frame)
            subView.contentMode = .ScaleAspectFill
            subView.layer.masksToBounds = true
            subView.image = backgrounds[index]
            imageViews.append(subView)
        }
        
        for image in imageViews {
            self.scrollView.addSubview(image)
        }
        
        colorView.frame = CGRectMake(0, 0, scrollView.frame.width*3, scrollView.frame.height)
        colorView.alpha = 0.4
        self.scrollView.addSubview(colorView)
        colorView.backgroundColor = Colors.primaryBlue
        
        scrollView.contentSize = CGSizeMake(scrollViewWidth * 3, scrollViewHeight)
        pageControl.addTarget(self, action: #selector(LoginViewController.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        facebookLoginButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6).CGColor
        facebookLoginButton.layer.borderWidth = 1
        
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Vertical
        let maximumVerticalOffset = scrollView.contentSize.height - CGRectGetHeight(scrollView.frame)
        let currentVerticalOffset = scrollView.contentOffset.y
        
        // Horizontal
        let maximumHorizontalOffset = scrollView.contentSize.width - CGRectGetWidth(scrollView.frame)
        let currentHorizontalOffset = scrollView.contentOffset.x
        
        // Percentages
        let percentageHorizontalOffset = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset = currentVerticalOffset / maximumVerticalOffset
        
        scrollViewdidScrollToPercentageOffset(scrollView, percentageOffset: CGPointMake(percentageHorizontalOffset, percentageVerticalOffset))
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        onboardLabel.pushTransition(0.15, effect: "fade")
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        switch pageControl.currentPage {
        case 0:
            onboardLabel.text = strings[0]
        case 1:
            onboardLabel.text = strings[1]
        case 2:
            onboardLabel.text = strings[2]
        default:
            print("Default")
        }
    }
    
    func scrollViewdidScrollToPercentageOffset(scrollView: UIScrollView, percentageOffset: CGPoint) {
    
        var colors = [Colors.primaryBlue, Colors.accentRed, UIColor.cyanColor()]
        
        
        if (percentageOffset.x < 0.5) {
        // multiply the offset by 2 because we want 0.5 to be 100%
        colorView.backgroundColor = fadeFromColor(colors[0], toColor: colors[1], withPercentage: percentageOffset.x*2)
        } else {
        // minus 0.5 because we want 0.5 to be 0%
        colorView.backgroundColor = fadeFromColor(colors[1], toColor: colors[2], withPercentage: (percentageOffset.x - 0.5)*2)
        }
        
    }
    
    func fadeImageAlpha(currentAlpha: CGFloat, toAlpha: CGFloat, withPercentage:CGFloat) -> CGFloat {
        
        return (toAlpha - currentAlpha) * withPercentage + currentAlpha
        
    }
    
    func fadeFromColor(fromColor: UIColor, toColor: UIColor, withPercentage: CGFloat) -> UIColor {
    
        var fromRed: CGFloat = 0.0
        var fromGreen: CGFloat = 0.0
        var fromBlue: CGFloat = 0.0
        var fromAlpha: CGFloat = 0.0
        
        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)
        
        var toRed: CGFloat = 0.0
        var toGreen: CGFloat = 0.0
        var toBlue: CGFloat = 0.0
        var toAlpha: CGFloat = 0.0
        
        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)
        
        //calculate the actual RGBA values of the fade colour
        let red = (toRed - fromRed) * withPercentage + fromRed
        let green = (toGreen - fromGreen) * withPercentage + fromGreen
        let blue = (toBlue - fromBlue) * withPercentage + fromBlue
        let alpha = (toAlpha - fromAlpha) * withPercentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    
}


// MARK: Account Authentication w/ Facebook and API

extension LoginViewController {
    
    
    @IBAction func facebookLogin(sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: self) { (result: FBSDKLoginManagerLoginResult!, error: NSError!) in
            
            if error != nil {
                
                // TODO: Show Error message
                debugPrint(error.localizedDescription)
            } else {
                self.returnUserData()
            }
        }
    }
    
    
    func returnUserData() {
        
        Requests.createSession(["facebook", FBSDKAccessToken.currentAccessToken().appID, FBSDKAccessToken.currentAccessToken().userID, FBSDKAccessToken.currentAccessToken().tokenString, (self.deviceName + " " + self.deviceOS)],completion: {(successful, error) -> Void in
            
            if successful {
            
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let controller = storyboard.instantiateInitialViewController() {
                    self.presentViewController(controller, animated: true, completion: { () -> Void in
                        self.view.window?.rootViewController = controller
                    })
                }
                
            } else {
                debugPrint(error)
            }
            
        })
        
//        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me",
//            parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(480).height(480)"])
//        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
//        })
    }
    
    
}
