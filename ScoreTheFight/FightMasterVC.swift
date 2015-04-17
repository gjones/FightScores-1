
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
    var animation = Animation()
    
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
    
    @IBAction func changeFightContext(sender: AnyObject) {
        
        if segmentedControl.selectedIndex == 0 {
            println("Showing All Fights")
            fetchedFightsController.fetchRequest.predicate = nil
            fetchedFightsController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            self.fetchedFightsController.performFetch(nil)
            fightTableView.reloadData()
            labelNoFights.text = "Add a fight to get started"
            let noFightImage = UIImage(named: "Add.png") as UIImage?
            buttonNoFights.setImage(noFightImage, forState: .Normal)
            buttonNoFights.alpha = 1
            animation.stopTheAnimation(buttonNoFights)
            
        } else if segmentedControl.selectedIndex == 1 {
            println("Showing Today's Fights")
            fetchedFightsController.fetchRequest.predicate = NSPredicate(format: "context == %@", "Present")
            fetchedFightsController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            labelNoFights.text = "No fights set for today"
            let noFightImage = UIImage(named: "icon_fighters.png") as UIImage?
            buttonNoFights.setImage(noFightImage, forState: .Normal)
            buttonNoFights.alpha = 0.65
            animation.stopTheAnimation(buttonNoFights)
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.18 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.animation.makeItPulse(self.buttonNoFights)
                self.animation.makeItGrow(self.buttonNoFights)
            }
            
        } else if segmentedControl.selectedIndex == 2 {
            println("Showing Future Fights")
            fetchedFightsController.fetchRequest.predicate = NSPredicate(format: "context == %@", "Future")
            fetchedFightsController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            labelNoFights.text = "No fights on the schedule"
            let noFightImage = UIImage(named: "icon_heavybag.png") as UIImage?
            buttonNoFights.setImage(noFightImage, forState: .Normal)
            buttonNoFights.alpha = 0.3
            animation.stopTheAnimation(buttonNoFights)
        
        } else if segmentedControl.selectedIndex == 3 {
            println("Showing Past Fights")
            fetchedFightsController.fetchRequest.predicate = NSPredicate(format: "context == %@", "Past")
            fetchedFightsController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            self.fetchedFightsController.performFetch(nil)
            self.fightTableView.reloadData()
            labelNoFights.text = "No fights previously scored"
            let noFightImage = UIImage(named: "icon_ring.png") as UIImage?
            buttonNoFights.setImage(noFightImage, forState: .Normal)
            buttonNoFights.alpha = 0.5
            animation.stopTheAnimation(buttonNoFights)
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
        
        segmentedControl.items = ["All", "Today", "Upcoming", "Past"]
        segmentedControl.thumbColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        segmentedControl.addTarget(self, action: "changeFightContext:", forControlEvents: .ValueChanged)
        
    }
    
    override func viewDidLoad() {
        labelNoFights.hidden = true
        buttonNoFights.hidden = true
        
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
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


