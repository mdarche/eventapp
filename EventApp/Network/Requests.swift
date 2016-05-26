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
    
    // MARK: Sessions Collection
    
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
    
    
    // MARK: Activities Collection
    
    class func getEventsCollection(location: String, completion : ((events: [Activity]?, successful: Bool, error: NSError?) -> Void)?) {
        
    }
    
    
    
    class func getActivity(activityId: Int, completion: ((activity: Activity?, successful: Bool, error: NSError?) -> Void)? ) {
        Alamofire.request(NetworkRouter.Activity(activityId)).validate().responseJSON { response in
            if let block = completion {
                switch response.result {
                    
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        let event = Activity(json: json)!
                        block(activity: event, successful: true, error: nil)
                    }
                    
                case .Failure(let error):
                    block(activity: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    
    // MARK: Profile Collection
    
    class func getProfile(profileId: String, completion: ((userData: User?, successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.Profile(profileId)).validate().responseJSON { response in
            if let block = completion {
                switch response.result {
                    
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        let person = User(json: json)!
                        block(userData: person, successful: true, error: nil)
                    }
                    
                case .Failure(let error):
                    block(userData: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    
}
