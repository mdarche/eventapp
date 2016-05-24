//
//  NetworkRouter.swift
//  EventApp
//
//  Created by Michael Darche on 5/19/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkRouter: URLRequestConvertible {
    static let baseURLPath = Domains.developmentURL
    static let authenticationToken = "Basic xxx"
    
    case CreateSession([AnyObject])
    case EventsCollection([String])
    case Event(Int)
    case Profile(String)
    
    public var URLRequest: NSMutableURLRequest {
        let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
            switch self {

            case CreateSession(let authParams):
                let params = [ "provider" : authParams[0], "credentials" : [ "appId" : authParams[1], "userId" : authParams[2], "token" : authParams[3] ] ]
                print("Session params are --> \(params)")
                return ("/session", .POST, params)
                
            case .EventsCollection(let locationParams):
                let params = [ "location" : locationParams[0], "area" : locationParams[1] ]
                return ("/events/?location=location&area=area", .GET, params)
                
            case .Event(let eventId):
                let params = [ "event_id" : eventId ]
                return ("/events/event_id", .GET, params)
                
            case .Profile(let profileId):
                let params = [ "profile_id" : profileId ]
                return ("/profile/profile_id", .GET, params)
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
