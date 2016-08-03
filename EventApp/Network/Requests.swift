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
import KeychainAccess

public let keychain = Keychain(service: "Authentication")

class Requests {
    
    // MARK: Sessions Collection
    
    class func createSession(authParams: [AnyObject], completion: ((successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.CreateSession(authParams)).validate().responseJSON { response in
            if let block = completion {
                
                
                // Decode the serialized request json
                let decodedJSON = try! NSJSONSerialization.JSONObjectWithData((response.request?.HTTPBody)!, options: [])

                // Print request info
                
                print(response.request)  // original URL request
                print("Headers: \(response.request?.allHTTPHeaderFields)") // header
                print("Serialized json: \(response.request?.HTTPBody)") // Json body
                print("Decoded json: \(decodedJSON)") // Decoded Json body
                
                // Print response info
                
                print("Response and result data starts here:")
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)  // response result
            
                
                switch response.result {
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        
                        // Store values in Keychain
                        keychain["accessToken"] = json["access_token"].string!
                        keychain["refreshToken"] = json["refresh_token"].string!
                        keychain["tokenExpiration"] = json["expiration"].string!
                        
                        block(successful: true, error: nil)
                    }
                    
                case .Failure(let error):
                    debugPrint(error)
                    block(successful: false, error: error)
                }
            }
        }
    }
    
    
    class func renewSession(completion: ((successful: Bool, error: NSError?) -> Void)?) {
        let refreshToken = try? keychain.get("refreshToken")
        Alamofire.request(NetworkRouter.RenewSession(refreshToken!!)).validate().responseJSON { response in
            if let block = completion {
                
                switch response.result {
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        
                        // Store values in Keychain
                        keychain["accessToken"] = json["access_token"].string!
                        keychain["refreshToken"] = json["refresh_token"].string!
                        keychain["tokenExpiration"] = json["expiration"].string!
                        block(successful: true, error: nil)
                    }
    
                case .Failure(let error):
                    debugPrint(error)
                    block(successful: false, error: error)
                }
            }
        }
    }
    
    
    
    // MARK: Activities Collection
    
    class func getActivitiesCollection(locationParams: [String], completion : ((activities: [Activity]?, successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.ActivitiesCollection(locationParams)).validate().responseJSON { response in
            if let block = completion {
                var activities = [Activity]()
                switch response.result {
                    
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        guard let items = json["activities"].array else {
                            block(activities: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            activities.append(Activity(json: item)!)
                        }
                        block(activities: activities, successful: true, error: nil)
                    }
                    
                case .Failure(let error):
                    block(activities: nil, successful: false, error: error)
                }
            }
        }
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
    
    
    class func getActivityMedia(mediaParams: [AnyObject], completion: ((media: [Media]?, successful: Bool, error: NSError?) -> Void)? ) {
        Alamofire.request(NetworkRouter.ActivityMedia(mediaParams)).validate().responseJSON { response in
            if let block = completion {
                var activityMedia = [Media]()
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        guard let items = json["media"].array else {
                            block(media: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            activityMedia.append(Media(json: item)!)
                        }
                        block(media: activityMedia, successful: true, error: nil)
                    }
                case .Failure(let error):
                    block(media: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    class func getActivityAttendees(attendeeParams: [AnyObject], completion: ((attendees: [User]?, successful: Bool, error: NSError?) -> Void)? ) {
        Alamofire.request(NetworkRouter.ActivityAttendees(attendeeParams)).validate().responseJSON { response in
            if let block = completion {
                var activityAttendees = [User]()
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        guard let items = json["attendees"].array else {
                            block(attendees: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            activityAttendees.append(User(json: item)!)
                        }
                        block(attendees: activityAttendees, successful: true, error: nil)
                    }
                case .Failure(let error):
                    block(attendees: nil, successful: false, error: error)
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
    
    
    class func getProfileFollowing(followingParams: [AnyObject], completion: ((following: [User]?, successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.ProfileFollowing(followingParams)).validate().responseJSON { response in
            if let block = completion {
                var profileFollowing = [User]()
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        guard let items = json["following"].array else {
                            block(following: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            profileFollowing.append(User(json: item)!)
                        }
                        block(following: profileFollowing, successful: true, error: nil)
                    }
                case .Failure(let error):
                    block(following: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    class func getProfileFollowers(followerParams: [AnyObject], completion: ((followers: [User]?, successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.ProfileFollowers(followerParams)).validate().responseJSON { response in
            if let block = completion {
                var profileFollowers = [User]()
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        guard let items = json["followers"].array else {
                            block(followers: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            profileFollowers.append(User(json: item)!)
                        }
                        block(followers: profileFollowers, successful: true, error: nil)
                    }
                case .Failure(let error):
                    block(followers: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    class func getProfileMedia(mediaParams: [AnyObject], completion: ((media: [Media]?, successful: Bool, error: NSError?) -> Void)? ) {
        Alamofire.request(NetworkRouter.ProfileMedia(mediaParams)).validate().responseJSON { response in
            if let block = completion {
                var profileMedia = [Media]()
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        guard let items = json["media"].array else {
                            block(media: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            profileMedia.append(Media(json: item)!)
                        }
                        block(media: profileMedia, successful: true, error: nil)
                    }
                case .Failure(let error):
                    block(media: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    class func getProfileActivities(activityParams: [AnyObject], completion : ((activities: [Activity]?, successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.ProfileActivities(activityParams)).validate().responseJSON { response in
            if let block = completion {
                var activities = [Activity]()
                switch response.result {
                    
                case .Success:
                    if let value = response.result.value  {
                        let json = JSON(value)
                        guard let items = json["activities"].array else {
                            block(activities: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            activities.append(Activity(json: item)!)
                        }
                        block(activities: activities, successful: true, error: nil)
                    }
                    
                case .Failure(let error):
                    block(activities: nil, successful: false, error: error)
                }
            }
        }
    }
    
    
    class func attendActivity(activityId: String, completion: ((successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.AttendActivity(activityId)).validate().responseJSON { response in
            if let block = completion {
                switch response.result {
                case .Success:
                    block(successful: true, error: nil)
                case .Failure(let error):
                    block(successful: false, error: error)
                }
            }
        }
    }
    
    
    class func cancelActivity(activityId: String, completion: ((successful: Bool, error: NSError?) -> Void)?) {
        Alamofire.request(NetworkRouter.CancelActivity(activityId)).validate().responseJSON { response in
            if let block = completion {
                switch response.result {
                case .Success:
                    block(successful: true, error: nil)
                case .Failure(let error):
                    block(successful: false, error: error)
                }
            }
        }
    }
    
    
    class func getProfileSettings(completion: ((settings: [String : AnyObject]?, successful: Bool, error: NSError?) -> Void)?) {
        // TODO: call current userID for params here
        Alamofire.request(NetworkRouter.ProfileSettings("FakeStringForTesting")).validate().responseJSON { response in
            if let block = completion {
                let settings = [String:AnyObject]()
                
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        //TODO: figure out what to do with this dictionary
                        guard let items = json["notifications"].dictionary else {
                            block(settings: nil, successful: false, error: nil)
                            return
                        }
                        for item in items {
                            debugPrint(item)
                        }
                        block(settings: settings, successful: true, error: nil)
                    }
                case .Failure(let error):
                    block(settings: nil, successful: false, error: error)
                }
            }
        }
    }
    
}
