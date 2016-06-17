//
//  DataController.swift
//  EventApp
//
//  Created by Michael Darche on 6/15/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import Foundation
import CoreData

class DataController: NSObject {
    
    var managedObjectContext: NSManagedObjectContext
    
    override  init() {

        guard let modelURL = NSBundle.mainBundle().URLForResource("CurrentUser", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        self.managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]

        let storeURL = docURL.URLByAppendingPathComponent("CurrentUser.sqlite")
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
    }
}