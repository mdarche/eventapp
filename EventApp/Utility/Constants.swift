//
//  Constants.swift
//  EventApp
//
//  Created by Michael Darche on 5/2/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation

enum Domains {
    static let test = "http://private-87ec1-eventsapp2.apiary-mock.com"
}


enum Segues {
    static let showOrganizerEvent = "ShowEventFromOrganizer"
    static let showMapEvent = "ShowEventFromMap"
    static let showListEvent = "ShowEventFromList"
    
    static let showProfileMedia = "ShowProfileMedia"
    static let showProfile = "ShowMyProfile"
    static let showFFTable = "ShowFFTable"
    
    static let showUserProfile = "ShowUserProfile"
    static let showAttending = "ShowAttending"
    
    static let showSettingsFromMenu = "SettingsToEditProfile"
    static let showSettingsFromProfile = "ProfileToEditProfile"
    
    static let showNotificationSettings = "ShowNotificationSettings"
    static let showPrivacyPolicy = "ShowPrivacyPolicy"
    static let showTerms = "ShowTerms"
    static let showInviteTable = "ShowInviteTable"
    
    static let showMediaFeedView = "ShowMediaFeedView"
}

enum Identifiers {
    static let eventAttendingCell = "AttendingCell"
    static let profileActivityCell = "ActivityCell"
    static let profileMediaCell = "MediaCell"
    static let profileHeader = "ProfileViewHeader"
    
    static let followInviteCell = "FFICell"
    
    static let eventMediaCell = "EventMediaCell"
    static let eventActivityCell = "EventActivityCell"
    static let eventHeader = "EventViewHeader"
    
    static let feedHeader = "feedHeader"
    static let feedMediaCell = "FeedCell"
    
    static let organizerNewsCell = "OrganizerNewsCell"
    static let organizerUpcomingCell = "OrganizerUpcomingCell"
    
    static let TabBarID = "mainTabBar"
    
}

struct Colors {
    static let primaryBlue = UIColor(red: 61/255, green: 90/255, blue: 254/255, alpha: 1.0)
    
    static let darkBlue = UIColor(red: 42/255, green: 74/255, blue: 209/255, alpha: 1.0)
    static let darkBlueHalf = UIColor(red: 42/255, green: 74/255, blue: 209/255, alpha: 0.5)
    static let darkestBlue = UIColor(red: 30/255, green: 32/255, blue: 42/255, alpha: 1.0)
    
    static let accentRed = UIColor(red: 255/255, green: 23/255, blue: 68/255, alpha: 1.0)
}