//
//  ViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData
import QuartzCore

class FightTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fightTableView: UITableView!
    @IBOutlet weak var addFightButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    
    var fightList:Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redButton(addFightButton)
        // navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(animated: Bool) {
       //  navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        // Reference to our app delegate
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let fetchReq = NSFetchRequest(entityName: "Fight")
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo.png"))
        view.backgroundColor = UIColor .blackColor()
        
        // Fetch and reload table data
        fightList = context.executeFetchRequest(fetchReq, error: nil)!
        fightTableView.reloadData()

        addFightButton.layer.cornerRadius = 2

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    // Segue for Detail View
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Specify specific segue, prevents nil
        if segue.identifier == "detailSegue" {
            let index = fightTableView.indexPathForSelectedRow()?.row
            var selectedFight: NSManagedObject = fightList[index!] as! NSManagedObject
            let fightDetailViewController: FightDetailViewController = segue.destinationViewController as! FightDetailViewController
            
            // Get nicely formatted date
            var rawDate = selectedFight.valueForKeyPath("date") as! NSDate
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat  = "dd MMMM, yyyy"
            let timestamp = dateFormatter.stringFromDate(rawDate)
            
            // Pass data through to see item page
            fightDetailViewController.boxerA = selectedFight.valueForKey("boxerA") as? String
            fightDetailViewController.boxerB = selectedFight.valueForKey("boxerB") as? String
            fightDetailViewController.rounds = selectedFight.valueForKey("rounds") as? String
            fightDetailViewController.date = timestamp
            fightDetailViewController.notes = selectedFight.valueForKey("notes") as? String
            fightDetailViewController.boxerA_totalScore = selectedFight.valueForKey("boxerA_totalScore") as? String
            fightDetailViewController.boxerB_totalScore = selectedFight.valueForKey("boxerB_totalScore") as? String
            fightDetailViewController.boxerA_round1 = selectedFight.valueForKey("boxerA_round1") as? String
            fightDetailViewController.boxerB_round1 = selectedFight.valueForKey("boxerB_round1") as? String
            fightDetailViewController.boxerA_round2 = selectedFight.valueForKey("boxerA_round2") as? String
            fightDetailViewController.boxerB_round2 = selectedFight.valueForKey("boxerB_round2") as? String
            fightDetailViewController.boxerA_round3 = selectedFight.valueForKey("boxerA_round3") as? String
            fightDetailViewController.boxerB_round3 = selectedFight.valueForKey("boxerB_round3") as? String
            fightDetailViewController.boxerA_round4 = selectedFight.valueForKey("boxerA_round4") as? String
            fightDetailViewController.boxerB_round4 = selectedFight.valueForKey("boxerB_round4") as? String
            fightDetailViewController.boxerA_round5 = selectedFight.valueForKey("boxerA_round5") as? String
            fightDetailViewController.boxerB_round5 = selectedFight.valueForKey("boxerB_round5") as? String
            fightDetailViewController.boxerA_round6 = selectedFight.valueForKey("boxerA_round6") as? String
            fightDetailViewController.boxerB_round6 = selectedFight.valueForKey("boxerB_round6") as? String
            fightDetailViewController.boxerA_round7 = selectedFight.valueForKey("boxerA_round7") as? String
            fightDetailViewController.boxerB_round7 = selectedFight.valueForKey("boxerB_round7") as? String
            fightDetailViewController.boxerA_round8 = selectedFight.valueForKey("boxerA_round8") as? String
            fightDetailViewController.boxerB_round8 = selectedFight.valueForKey("boxerB_round8") as? String
            fightDetailViewController.boxerA_round9 = selectedFight.valueForKey("boxerA_round9") as? String
            fightDetailViewController.boxerB_round9 = selectedFight.valueForKey("boxerB_round9") as? String
            fightDetailViewController.boxerA_round10 = selectedFight.valueForKey("boxerA_round10") as? String
            fightDetailViewController.boxerB_round10 = selectedFight.valueForKey("boxerB_round10") as? String
            fightDetailViewController.boxerA_round11 = selectedFight.valueForKey("boxerA_round11") as? String
            fightDetailViewController.boxerB_round11 = selectedFight.valueForKey("boxerB_round11") as? String
            fightDetailViewController.boxerA_round12 = selectedFight.valueForKey("boxerA_round12") as? String
            fightDetailViewController.boxerB_round12 = selectedFight.valueForKey("boxerB_round12") as? String
            fightDetailViewController.thisFight = selectedFight
            println(selectedFight)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fightList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let fightCell:FightTableViewCell? = fightTableView.dequeueReusableCellWithIdentifier("fightCell") as? FightTableViewCell
     
        if let fightIndexPath = indexPath as NSIndexPath? {
            var data: NSManagedObject = fightList[fightIndexPath.row] as! NSManagedObject
            var rounds = data.valueForKeyPath("rounds") as? String
            
            // Get nicely formatted date
            var rawDate = data.valueForKeyPath("date") as! NSDate
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat  = "dd MMMM, yyyy"
            let timestamp = dateFormatter.stringFromDate(rawDate)
            
            // Set data to be passed
            fightCell?.labelBoxerA.text = data.valueForKeyPath("boxerA") as? String
            fightCell?.labelBoxerB.text = data.valueForKeyPath("boxerB") as? String
            fightCell?.labelRounds.text = "\(rounds!) Rounds"
            fightCell?.labelFightDate.text = timestamp
            fightCell?.labelBoxerATotal.text = data.valueForKeyPath("boxerA_totalScore") as? String
            fightCell?.labelBoxerBTotal.text = data.valueForKeyPath("boxerB_totalScore") as? String

        }
        
        fightCell?.selectionStyle = UITableViewCellSelectionStyle.None
        
        return fightCell!
    }
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            if let fightTable = self.fightTableView {
                context.deleteObject(fightList[indexPath.row] as! NSManagedObject)
                fightList.removeAtIndex(indexPath.row)
                fightTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
            var error: NSError? = nil
            if !context.save(&error) {
                abort()
            }
        }
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let fightCell:FightTableViewCell? = fightTableView.dequeueReusableCellWithIdentifier("fightCell") as? FightTableViewCell
        
        fightCell?.layer.backgroundColor = UIColor .redColor().CGColor
        fightCell?.backgroundColor = UIColor .redColor()
    }
    
    func redButton(buttonInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 85/255, green: 23/255, blue: 24/255, alpha: 0.8)
        var lightBurgundyColor = UIColor(red: 65/255, green: 23/255, blue: 24/255, alpha: 0.9)
        
        buttonInQuestion.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        buttonInQuestion.titleLabel?.textColor = UIColor .whiteColor()
        buttonInQuestion.backgroundColor = burgundyColor
        
        buttonInQuestion.addTarget(self, action: "activeButton:", forControlEvents: .TouchCancel)
    
    }
    
    func activeButton(sender: UIButton!) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        sender.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        sender.layer.borderColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 1).CGColor

    }



}

