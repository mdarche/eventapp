//
//  Constants.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation

enum Domains {
    static let developmentURL = "http://private-87ec1-eventsapp2.apiary-mock.com"
}


enum Segues {
    static let showEvent = "showEvent"
    static let showMedia = "ShowMedia"
    static let showProfile = "ShowMyProfile"
}

enum Identifiers {
    static let profileActivityCell = "ActivityCell"
    static let profileMediaCell = "MediaCell"
    static let profileHeader = "ProfileViewHeader"
    
    static let eventMediaCell = "EventMediaCell"
    static let eventActivityCell = "EventActivityCell"
    static let eventHeader = "EventViewHeader"
    
    static let feedHeader = "feedHeader"
    static let feedMediaCell = "FeedCell"
    
    static let organizerCell = "OrganizerCell"
    
    static let TabBarID = "mainTabBar"
    
}

struct Colors {
    static let mainDarkFull = UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0)
    static let mainDarkHalf = UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 0.5)
    
    static let mainBlueFull = UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 1.0)
    static let mainBlueHalf = UIColor(red: 71/255, green: 70/255, blue: 236/255, alpha: 0.5)
}