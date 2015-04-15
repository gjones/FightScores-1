
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
    @IBOutlet weak var buttonSettings: UIButton!
    @IBOutlet weak var buttonNoFights: UIButton!
    @IBOutlet var segmentedControl: CustomSegmentedControl!

    let userDefaults = NSUserDefaults.standardUserDefaults()
    var fightDate = FightDate()
    
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
    
    var _fetchedFightsController : NSFetchedResultsController? = nil
    
    // MARK: Segmented Control
    
    func showFilters(filtersOn: Bool) {
        let filtersOn = filtersOn
        var result: Bool?
        var constraint: CGFloat?
        if filtersOn == true {
            result = false
            constraint = 85
        } else if filtersOn == false {
            result = true
            constraint = 10
        }
        
        segmentedControl.hidden = result!
    }
    
    @IBAction func changeFightContext(sender: AnyObject) {
        
        if segmentedControl.selectedIndex == 0 {
            println("Showing All Fights")
            fetchedFightsController.fetchRequest.predicate = nil
            self.fetchedFightsController.performFetch(nil)
            fightTableView.reloadData()
            println("All Fights: \(fetchedFightsController.sections![0].numberOfObjects)")
            
        } else if segmentedControl.selectedIndex == 1 {
            println("Showing Today's Fights")
            fetchedFightsController.fetchRequest.predicate = NSPredicate(format: "context == %@", "Present")
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            println("Todays Fights: \(fetchedFightsController.sections![0].numberOfObjects)")
            
        } else if segmentedControl.selectedIndex == 2 {
            println("Showing Future Fights")
            fetchedFightsController.fetchRequest.predicate = NSPredicate(format: "context == %@", "Future")
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            println("Future Fights: \(fetchedFightsController.sections![0].numberOfObjects)")
            
        } else if segmentedControl.selectedIndex == 3 {
            println("Showing Past Fights")
            fetchedFightsController.fetchRequest.predicate = NSPredicate(format: "context == %@", "Past")
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            
            println("Past Fights: \(fetchedFightsController.sections![0].numberOfObjects)")
        }
    }

    var fetchedFightsController : NSFetchedResultsController {
        if _fetchedFightsController == nil {
            let request = NSFetchRequest(entityName: "Fight")
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            request.fetchBatchSize = 20
            
            let regularFetchedFightsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
            regularFetchedFightsController.delegate = self
            _fetchedFightsController = regularFetchedFightsController
            
            var error: NSError? = nil
            if !_fetchedFightsController!.performFetch(&error) {
                println("I'm so sorry everyone")
                abort()
            }
        }
        return _fetchedFightsController!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fightTableView.backgroundColor = UIColor .clearColor()
        stack.updateContextWithUbiquitousContentUpdates = true
        self.fetchedFightsController.performFetch(nil)
        self.fightTableView.reloadData()
        persistentStoreCoordinatorChangesObserver = NSNotificationCenter.defaultCenter()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        labelNoFights.hidden = true
        buttonNoFights.hidden = true
        
        segmentedControl.items = ["All", "Today", "Future", "Past"]
        segmentedControl.thumbColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        segmentedControl.addTarget(self, action: "changeFightContext:", forControlEvents: .ValueChanged)
        
    }
    
    override func viewDidLoad() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(1.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.stack.updateContextWithUbiquitousContentUpdates = true
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            println("There are \(self.fightCount) fights in the database")
        }
        
        var filterDisplayResponse: Bool? = userDefaults.objectForKey("filterDisplay") as! Bool?
        if filterDisplayResponse == nil {
            filterDisplayResponse == false
            userDefaults.setObject(filterDisplayResponse, forKey: "filterDisplay")
        }
        
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        stack.updateContextWithUbiquitousContentUpdates = false
        persistentStoreCoordinatorChangesObserver = nil
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.18 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            UIView.animateWithDuration(0.3, animations: {
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "header_bg.png"), forBarMetrics: UIBarMetrics.Default)
            })
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
            fetchedFightsController.performFetch(nil)
    }

    var fightCount : Int {
        return fetchedFightsController.sections![0].numberOfObjects
    }

    func getFightAtIndexPath(indexPath : NSIndexPath) -> Fight {
        return fetchedFightsController.objectAtIndexPath(indexPath) as! Fight
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var objects = fetchedFightsController.fetchedObjects
        
        if let objects = objects {
            if objects.count == 0 {
                labelNoFights.alpha = 0.3
                labelNoFights.hidden = false
                buttonNoFights.hidden = false
                buttonSettings.hidden = true
            } else {
                labelNoFights.hidden = true
                buttonNoFights.hidden = true
                buttonSettings.alpha = 0.7
                buttonSettings.hidden = false
            }
            return objects.count
        }
        return 0
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        fightTableView.beginUpdates()
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        let fight = fetchedFightsController.fetchedObjects![indexPath.row] as! Fight
//        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
//            Int64(3 * Double(NSEC_PER_SEC)))
//            dispatch_after(delayTime, dispatch_get_main_queue()) {
//                var setContext = self.fightDate.establishDateContext(fight.date)
//                fight.context = setContext
//            }
//        })
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Covering my back for 1.1
        let fight = fetchedFightsController.fetchedObjects![indexPath.row] as! Fight
        if fight.context.isEmpty {
            fight.context == "Past"
        }
        
        var identifier = "FightCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! FightCell;
        cell.fight = fetchedFightsController.fetchedObjects![indexPath.row] as? Fight
        
        return cell
        
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch(type) {
        case .Insert:
            if let newIndexPath = newIndexPath {
                fightTableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            }
        case .Delete:
            if let indexPath = indexPath {
                fightTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        default:
            break
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        fightTableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                let fight = fetchedFightsController.fetchedObjects![indexPath.row] as! Fight
                stack.context.deleteObject(fight)
                stack.save()
            }
            
    }
    
    @IBAction func unwindToFightList(segue:UIStoryboardSegue) {
        var error : NSErrorPointer = nil
        if stack.context.hasChanges {
            if stack.context.save(error) == false {
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
                    if let objects = fetchedFightsController.fetchedObjects {
                        detailView.fight = objects[selectedIndex.row] as? Fight
                    }
                }
        }
    }
    

}


