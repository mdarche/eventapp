//
//  LoginViewController.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate, FBSDKLoginButtonDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    @IBOutlet weak var onboardLabel: UILabel!
    
    var colors:[UIColor] = [UIColor.blueColor(), UIColor.purpleColor(), UIColor.magentaColor()]
    var strings = ["Test string about how this app is the greatest", "Second test about why this app is the greatest", "This app is the greatest, check it out"]
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        configureFacebook()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Set Up Scrollview and Paging
    
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
            
            let subView = UIView(frame: frame)
            subView.backgroundColor = colors[index]
            self.scrollView.addSubview(subView)
        }
        
        scrollView.contentSize = CGSizeMake(scrollViewWidth * 3, scrollViewHeight)
        pageControl.addTarget(self, action: #selector(LoginViewController.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        onboardLabel.pushTransition(0.2, effect: "fade")
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

}


// MARK: Account Authentication w/ Facebook and API

extension LoginViewController {
    
    func configureFacebook()
    {
        facebookLoginButton.readPermissions = ["public_profile", "email", "user_friends"];
        facebookLoginButton.delegate = self
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        let userToken = result.token
        print(userToken)
        
        if (error != nil) {
            print(error.localizedDescription)
        } else {
            returnUserData()
        }
        
//            print("Token = \(FBSDKAccessToken.currentAccessToken().tokenString)")
//            print("User ID = \(FBSDKAccessToken.currentAccessToken().userID)")
    }
    
    func returnUserData() {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(480).height(480)"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let id : NSString = result.valueForKey("id") as! String
                print("User ID is: \(id)")

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let controller = storyboard.instantiateInitialViewController() {
                    self.presentViewController(controller, animated: true, completion: { () -> Void in
                        self.view.window?.rootViewController = controller
                    })
                }
                
            }
        })
    }

    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
    
    }
    
}
