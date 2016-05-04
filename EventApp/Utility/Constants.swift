//
//  Constants.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation

let TestDomain = "http://private-87ec1-eventsapp2.apiary-mock.com"

enum Routes {
    static let getNearbyEvents = "\(TestDomain)/events/?location=location"
}

enum Segues {
    
}

enum Identifiers {
    static let profileActivityCell = "ActivityCell"
    static let profileMediaCell = "MediaCell"
    static let profileHeader = "ProfileViewHeader"
    
}