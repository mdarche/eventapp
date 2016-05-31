//
//  NetworkRouter.swift
//  EventApp
//
//  Created by Michael Darche on 5/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import Alamofire

let accessToken = keychain["accessToken"]

public enum NetworkRouter: URLRequestConvertible {
    
    static let baseURLPath = Domains.test
//    static let authenticationToken = "Bearer \(accessToken!)"
    static let authenticationToken = "Bearer {access_token}"
    
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
    
    case Notifications
    
    public var URLRequest: NSMutableURLRequest {
        let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
            switch self {

            // Session Requests
                
            case .CreateSession(let authParams):
                let params = [ "provider" : authParams[0], "credentials" : [ "appId" : authParams[1], "userId" : authParams[2], "token" : authParams[3] ] ]
                return ("/session", .POST, params)
            
            case .RenewSession(let refreshToken):
                let params = [ "refreshToken" : refreshToken]
                return ("/session", .PUT, params)
                
            // Activity Requests
                
            case .ActivitiesCollection(let locationParams):
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
                
            // Notification Requests
                
            case .Notifications:
                let params = [ String : AnyObject ]()
                return ("/notifications", .GET, params)
            }
        }()
        
        let URL = NSURL(string: NetworkRouter.baseURLPath)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.HTTPMethod = result.method.rawValue
        URLRequest.setValue(NetworkRouter.authenticationToken, forHTTPHeaderField: "Authorization")
        URLRequest.timeoutInterval = NSTimeInterval(10 * 1000)
        
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
}
