//
//  NetworkRouter.swift
//  EventApp
//
//  Created by Michael Darche on 5/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import Alamofire


var accessToken : String? {
    get {
        return keychain["accessToken"]
    }
}

public enum NetworkRouter: URLRequestConvertible {
    
    static let baseURLPath = Domains.develop
    static let authenticationToken = "Bearer \(accessToken!)"
    
    case CreateSession([AnyObject])
    case RenewSession(String)
    
    case ActivitiesCollection([String])
    case Activity(Int)
    case ActivityMedia([AnyObject])
    case ActivityAttendees([AnyObject])
    
    case Profile(String)
    case UpdateProfile(String)
    case ProfileFollowing([AnyObject])
    case ProfileFollowers([AnyObject])
    case ProfileActivities([AnyObject])
    case ProfileMedia([AnyObject])
    case ProfileSettings(String)
    
    case AttendActivity(String)
    case CancelActivity(String)
    
    case Notifications
    
    public var URLRequest: NSMutableURLRequest {
        let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
            switch self {

            // Session Requests
                
            case .CreateSession(let authParams):
                let params = [ "provider" : authParams[0], "credentials" : [ "applicationID" : authParams[1], "userID" : authParams[2], "accessToken" : authParams[3] ], "deviceType" : "mobile" , "deviceID" : authParams[4]]
                return ("/sessions", .POST, params)
            
            case .RenewSession(let refreshToken):
                let params = [ "refreshToken" : refreshToken]
                return ("/sessions", .PUT, params)
                
            // Activity Requests
                
            case .ActivitiesCollection(let locationParams):0
                let params = [ "location" : locationParams[0], "area" : locationParams[1] ]
                return ("/activities", .GET, params)
                
            case .Activity(let activityId):
                let params = [ "activity_id" : activityId ]
                return ("/activities/activity_id", .GET, params)
                
            case .ActivityMedia(let skipParams):
                let params = [ "activity_id" : skipParams[0], "limit" : skipParams[1], "skip" : skipParams[2] ]
                return ("/activities/activity_id/media", .GET, params)
                
            case .ActivityAttendees(let skipParams):
                let params = [ "activity_id" : skipParams[0], "limit" : skipParams[1], "skip" : skipParams[2] ]
                return ("/activities/activity_id/attendees", .GET, params)
            
            // Profile Requests
                
            case .Profile(let profileId):
                let params = [ "profile_id" : profileId ]
                print(params)
                return ("/profile/profile_id", .GET, params)
                
            case .UpdateProfile(let profileId):
                let params = [ "profile_id" : profileId ]
                return ("/profile/profile_id", .PUT, params)
                
            case .ProfileFollowing(let followingInfo):
                let params = [ "profile_id" : followingInfo[0], "limit" : followingInfo[1], "skip" : followingInfo[2] ]
                return ("/profile/profile_id/following", .GET, params)
                
            case .ProfileFollowers(let followersInfo):
                let params = [ "profile_id" : followersInfo[0], "limit" : followersInfo[1], "skip" : followersInfo[2] ]
                return ("/profile/profile_id/followers", .GET, params)
                
            case .ProfileActivities(let activitiesInfo):
                let params = [ "profile_id" : activitiesInfo[0], "upcoming" : activitiesInfo[1], "past" : activitiesInfo[2] ]
                return ("/profile/profile_id/activities", .GET, params)
                
            case .ProfileMedia(let mediaInfo):
                let params = [ "profile_id" : mediaInfo[0], "limit" : mediaInfo[1], "skip" : mediaInfo[2] ]
                return ("/profile/profile_id/media", .GET, params)
                
            case .ProfileSettings(let profileId):
                let params = [ "profile_id" : profileId ]
                return ("/profile/profile_id/settings", .GET, params)
            
            // User Action Requests
                
            case .AttendActivity(let activityId):
                let params = [ "activityId" : activityId ]
                return ("/profile/profile_id/activities/", .POST, params)
                
            case .CancelActivity(let activityId):
                let params = [ "activityId" : activityId ]
                return ("/profile/profile_id/activities/", .DELETE, params)
                
            // Notification Requests
                
            case .Notifications:
                let params = [ String : AnyObject ]()
                return ("/notifications", .GET, params)
            }
        }()
        
        let URL = NSURL(string: NetworkRouter.baseURLPath)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.HTTPMethod = result.method.rawValue
        if accessToken != nil {
            URLRequest.setValue(NetworkRouter.authenticationToken, forHTTPHeaderField: "Authorization")
        }
        URLRequest.timeoutInterval = NSTimeInterval(10 * 1000)
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
}
