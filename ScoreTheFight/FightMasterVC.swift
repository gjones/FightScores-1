//
//  ViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData
import QuartzCore

class FightMasterVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    // Set Outlets
    @IBOutlet weak var fightTableView: UITableView!
    @IBOutlet weak var addFightButton: UIButton!
    @IBOutlet weak var labelNoFights: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    lazy var stack : CoreDataStack = {
        let options =
            [NSPersistentStoreUbiquitousContentNameKey: "FightScores",
            NSMigratePersistentStoresAutomaticallyOption: true,
            NSInferMappingModelAutomaticallyOption: true]
        let stack = CoreDataStack(modelName: "Fight",
            storeName: "FightScores",
            options: options)
        return stack
        }()
    
    var persistentStoreCoordinatorChangesObserver:
        NSNotificationCenter? {
        didSet {
            oldValue?.removeObserver(self,
                name: NSPersistentStoreCoordinatorStoresDidChangeNotification,
                object: stack.coordinator)
            oldValue?.removeObserver(self,
                name: NSPersistentStoreCoordinatorStoresWillChangeNotification,
                object: stack.coordinator)
            
            persistentStoreCoordinatorChangesObserver?.addObserver(self,
                selector: "persistentStoreCoordinatorDidChangeStores:",
                name: NSPersistentStoreCoordinatorStoresDidChangeNotification,
                object: stack.coordinator)
            persistentStoreCoordinatorChangesObserver?.addObserver(self,
                selector: "persistentStoreCoordinatorWillChangeStores:",
                name:NSPersistentStoreCoordinatorStoresWillChangeNotification,
                object: stack.coordinator)
        }
    }
    
    var _fights : NSFetchedResultsController? = nil
    var fights : NSFetchedResultsController {
        if _fights == nil {
            let request = NSFetchRequest(entityName: "Fight")
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            
            let fights = NSFetchedResultsController(fetchRequest: request, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
            fights.delegate = self
            _fights = fights
        }
        return _fights!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fights.performFetch(nil)
        fightTableView.reloadData()
        stack.updateContextWithUbiquitousContentUpdates = true
        
        persistentStoreCoordinatorChangesObserver = NSNotificationCenter.defaultCenter()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        stack.updateContextWithUbiquitousContentUpdates = false
        
        persistentStoreCoordinatorChangesObserver = nil
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.18 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "header_bg.png"), forBarMetrics: UIBarMetrics.Default)
        }
    }
    
    func persistentStoreCoordinatorWillChangeStores(
        notification: NSNotification){
            var error : NSErrorPointer = nil
            if stack.context.hasChanges {
                if stack.context.save(error) == false {
                    print("Error saving \(error)")
                }
            }
            stack.context.reset()
    }
    
    func persistentStoreCoordinatorDidChangeStores(
        notification:NSNotification){
            fights.performFetch(nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var objects = fights.fetchedObjects
        if let objects = objects
        {
            return objects.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let fight = fights.fetchedObjects![indexPath.row] as! Fight
        var identifier = "FightCell"

        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! FightCell;
        cell.fight = fights.fetchedObjects![indexPath.row] as? Fight
        return cell
    }
    
    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
            if editingStyle == .Delete {
                let fight = fights.fetchedObjects![indexPath.row] as! Fight
                stack.context.deleteObject(fight)
                stack.save()
            }
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.fightTableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController,
        didChangeObject anObject: AnyObject,
        atIndexPath indexPath: NSIndexPath?,
        forChangeType type: NSFetchedResultsChangeType,
        newIndexPath: NSIndexPath?) {
        switch(type) {
        case .Insert:
            if let newIndexPath = newIndexPath {
                self.fightTableView.insertRowsAtIndexPaths([newIndexPath],
                    withRowAnimation:UITableViewRowAnimation.Fade)
            }
            println("Insert")
        case .Delete:
            if let indexPath = indexPath {
                self.fightTableView.deleteRowsAtIndexPaths([indexPath],
                    withRowAnimation: UITableViewRowAnimation.Fade)
            }
            println("Remove")
        default:
            break
        }
    }

    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.fightTableView.endUpdates()
    }
    
    @IBAction
    func unwindToFightList(segue:UIStoryboardSegue) {
        NSLog("Unwinding to Fight List")
        var error : NSErrorPointer = nil
        if stack.context.hasChanges
        {
            if stack.context.save(error) == false
            {
                print("Error saving \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    // Segue for Detail View
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Specify specific segue, prevents nil
        if segue.identifier == "createFight"
        {
            let context = NSManagedObjectContext(concurrencyType: .ConfinementConcurrencyType)
            context.parentContext = stack.context
            let navController = segue.destinationViewController as! UINavigationController
            let nextViewController = navController.topViewController as! CreateFightVC
            nextViewController.managedObjectContext = context
        }
        if segue.identifier == "fightDetail" {
            let detailView = segue.destinationViewController as! FightDetailVC
                if let selectedIndex = fightTableView.indexPathForSelectedRow() {
                    if let objects = fights.fetchedObjects {
                        detailView.fight = objects[selectedIndex.row] as? Fight
                    }
                }
        }
    }
    

    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
        labelInQuestion.tintColor = UIColor .whiteColor()
        labelInQuestion.alpha = 0.800
    }    

}


