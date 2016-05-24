//
//  Requests.swift
//  EventApp
//
//  Created by Michael Darche on 5/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Requests {
    
    // MARK: Create Session
    
    class func createSession(authParams: [AnyObject], completion: ((successful: Bool, error: NSError?) -> Void)?) {
    
        Alamofire.request(NetworkRouter.CreateSession(authParams)).validate().responseJSON { response in
            if let block = completion {
            
                switch response.result {
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                 // TODO: Add json to keychain for token key
                        print("The APIARY response is: \(value)")
                        block(successful: true, error: nil)
                    }
                    
                case .Failure(let error):
                    print(error)
                    block(successful: false, error: error)
                }
            }
        }
        
    }
    
    
    // MARK: Get Collection Events for Map & Lists
    
    class func getEventsCollection() {
        
    }
    
    
    // MARK: Get Specific Event Data
    
    class func getEvent(eventId: Int) {
        Alamofire.request(NetworkRouter.Event(eventId)).validate().responseJSON { response in
            
            switch response.result {
            case .Success:
                if let value = response.result.value  {
                    let json = JSON(value)
                    
                    let event = Event(json: json)!
                    print("EVENT Data so far: \(event.media)")
                    print("EVENT Data so far: \(event.title)")
                    print("EVENT Data so far: \(event.coverImage)")
                    print("EVENT Data so far: \(event.latitude)")
                    print("EVENT Data so far: \(event.longitude)")
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Get User Profile Data
    
    class func getProfile(profileId: String, completionBlock: ((userData: [AnyObject]?, successful: Bool, error: NSError?) -> Void)?) {
        
    }
}
