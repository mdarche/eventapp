//
//  ListViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadData()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    }

    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // TODO
        
    }
    
    
    // MARK: View set up and functions
    
    func visualize() {

    }
    
    func downloadData() {
        
//        Alamofire.request(.GET, "http://private-87ec1-eventsapp2.apiary-mock.com/events/?location=location", parameters: ["location" : "34.8599979,33.5501066"], encoding: .URL).validate().responseJSON { (responseData) -> Void in
//            
//            print("Fetching Event Data Now")
//            
//            if((responseData.result.value) != nil) {
//                let json = JSON(responseData.result.value!)
//                print(json)
//            } else {
//                print("Error")
//            }
//        }
        
        Requests.getEvent(13)
        
        
    }
    
    
    // MARK: CollectionView Setup
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 95)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath) as! HomeFeedCell
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        performSegueWithIdentifier(Segues.showEvent, sender: indexPath)
        
        // TODO: Create protocol and delegate method
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
    
    }
    
    
}

