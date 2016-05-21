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
    static let baseURLPath = TestDomain
    static let authenticationToken = "Basic xxx"
    
    case EventsCollection([String])
    case Event(Int)
    case Profile(String)
    
    public var URLRequest: NSMutableURLRequest {
        let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
            switch self {

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
