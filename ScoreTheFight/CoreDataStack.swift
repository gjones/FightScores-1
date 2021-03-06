//
//  CoreDataStack.swift
//  FightScores
//
//  Created by Gareth Jones on 3/9/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import Foundation
import CoreData

@objc class CoreDataStack: Printable {
    var modelName : String
    var storeName : String
    var options: NSDictionary?
    var updateContextWithUbiquitousContentUpdates: Bool = false {
        willSet { ubiquitousChangesObserver = newValue ? NSNotificationCenter.defaultCenter() : nil }
    }
    
    private var ubiquitousChangesObserver : NSNotificationCenter? {
        didSet {
            oldValue?.removeObserver(self, name: NSPersistentStoreDidImportUbiquitousContentChangesNotification, object: coordinator)
            ubiquitousChangesObserver?.addObserver(self, selector: "persistentStoreDidImportUbiquitousContentChanges:", name: NSPersistentStoreDidImportUbiquitousContentChangesNotification, object:coordinator)
        }
    }
    
    init(modelName: String, storeName: String,
        options: NSDictionary? = nil) {
            self.modelName = modelName
            self.storeName = storeName
            self.options = options
    }
    
    func persistentStoreDidImportUbiquitousContentChanges(notification: NSNotification){
        NSLog("Merging ubiquitous content changes")
        context.performBlock {
            self.context.mergeChangesFromContextDidSaveNotification(notification)
        }
    }
    
    func save() {
        var error : NSErrorPointer = nil
        if context.hasChanges {
            if context.save(error) == false {
                println("Error saving \(error)")
            }
        }
    }
    
    var description : String
        {
            return "context: \(context)\n" +
                "modelName: \(modelName)" +
                //        "model: \(model.entityVersionHashesByName)\n" +
                //        "coordinator: \(coordinator)\n" +
            "storeURL: \(storeURL)\n"
            //        "store: \(store)"
    }
    
    var modelURL : NSURL {
        return NSBundle.mainBundle().URLForResource(self.modelName, withExtension: "momd")!
    }
    
    var storeURL : NSURL {
        var storePaths = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        let storePath = storePaths[0] as! String
        let fileManager = NSFileManager.defaultManager()
        
        fileManager.createDirectoryAtPath(storePath, withIntermediateDirectories:
            true, attributes: nil, error: nil)
        return NSURL.fileURLWithPath(storePath.stringByAppendingPathComponent(storeName + ".sqlite"))
    }
    
    lazy var model : NSManagedObjectModel = NSManagedObjectModel(contentsOfURL: self.modelURL)!
    
    var store : NSPersistentStore?
    
    private var _coordinator : NSPersistentStoreCoordinator? = nil
    var coordinator : NSPersistentStoreCoordinator {
        if _coordinator == nil {
            let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
            var storeError : NSError?
            store = coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil,
                URL: storeURL,
                options: self.options as? [NSObject : AnyObject],
                error: nil)
            if storeError != nil {
                println("store error \(storeError!)")
            }
            _coordinator = coordinator
        }
        return _coordinator!
    }
    
    private var _context : NSManagedObjectContext? = nil
    var context : NSManagedObjectContext {
        if _context == nil {
            let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            context.persistentStoreCoordinator = coordinator
            _context = context
            println(self)
        }
        return _context!
    }
    
}
