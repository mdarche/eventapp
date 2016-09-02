//
//  PrivacyTermsViewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/17/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class PrivacyTermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var isPrivacy: Bool?
    var requestObject: NSURLRequest?
    var url: NSURL?
    
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isPrivacy == true {
            setupForPrivacy()
        } else {
            setupForTerms()
        }
    }
    
    
    // MARK: - Class Functions
    
    func setupForPrivacy() {
        navigationItem.title = "Privacy Policy"
        url = NSURL(string: "http://google.com")
        requestObject = NSURLRequest(URL: url!)
        webView.loadRequest(requestObject!)
    }
    
    func setupForTerms() {
        navigationItem.title = "Terms of Service"
        url = NSURL(string: "http://google.com")
        requestObject = NSURLRequest(URL: url!)
        webView.loadRequest(requestObject!)
    }
}
