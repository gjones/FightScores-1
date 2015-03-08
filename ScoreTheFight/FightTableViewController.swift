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

    
    // Set Outlets
    @IBOutlet weak var fightTableView: UITableView!
    @IBOutlet weak var addFightButton: UIButton!
    @IBOutlet weak var labelNoFights: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    // Set Array
    var fights: [FightModel] = []
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    }

    override func viewWillDisappear(animated: Bool) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.18 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "header_bg.png"), forBarMetrics: UIBarMetrics.Default)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.title = "Fight Scores"
//        navigationItem.titleView = UIImageView(image: UIImage(named: "FSLogo.png"))

    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Reference to our app delegate
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let fetchReq = NSFetchRequest(entityName: "Fight")
        var error: NSError?
        
        // Fetch and reload table data
        fights = context.executeFetchRequest(fetchReq, error: &error) as! [FightModel]
        fightTableView.reloadData()

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
            var selectedFight: NSManagedObject = fights[index!] as NSManagedObject
            let fightDetailViewController: FightDetailViewController = segue.destinationViewController as! FightDetailViewController
            
            // Get nicely formatted date
            var rawDate = selectedFight.valueForKeyPath("date") as! NSDate
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat  = "dd MMMM, yyyy"
            let timestamp = dateFormatter.stringFromDate(rawDate)
            
            // Pass data through to see item page
            fightDetailViewController.boxerA = selectedFight.valueForKey("boxerA") as? String
            fightDetailViewController.boxerB = selectedFight.valueForKey("boxerB") as? String
            fightDetailViewController.rounds = selectedFight.valueForKey("rounds") as? NSNumber
            fightDetailViewController.date = timestamp
            fightDetailViewController.notes = selectedFight.valueForKey("notes") as? String
            fightDetailViewController.boxerA_totalScore = selectedFight.valueForKey("boxerA_totalScore") as? NSNumber
            fightDetailViewController.boxerB_totalScore = selectedFight.valueForKey("boxerB_totalScore") as? NSNumber
            fightDetailViewController.boxerA_round1 = selectedFight.valueForKey("boxerA_round1") as? NSNumber
            fightDetailViewController.boxerB_round1 = selectedFight.valueForKey("boxerB_round1") as? NSNumber
            fightDetailViewController.boxerA_round2 = selectedFight.valueForKey("boxerA_round2") as? NSNumber
            fightDetailViewController.boxerB_round2 = selectedFight.valueForKey("boxerB_round2") as? NSNumber
            fightDetailViewController.boxerA_round3 = selectedFight.valueForKey("boxerA_round3") as? NSNumber
            fightDetailViewController.boxerB_round3 = selectedFight.valueForKey("boxerB_round3") as? NSNumber
            fightDetailViewController.boxerA_round4 = selectedFight.valueForKey("boxerA_round4") as? NSNumber
            fightDetailViewController.boxerB_round4 = selectedFight.valueForKey("boxerB_round4") as? NSNumber
            fightDetailViewController.boxerA_round5 = selectedFight.valueForKey("boxerA_round5") as? NSNumber
            fightDetailViewController.boxerB_round5 = selectedFight.valueForKey("boxerB_round5") as? NSNumber
            fightDetailViewController.boxerA_round6 = selectedFight.valueForKey("boxerA_round6") as? NSNumber
            fightDetailViewController.boxerB_round6 = selectedFight.valueForKey("boxerB_round6") as? NSNumber
            fightDetailViewController.boxerA_round7 = selectedFight.valueForKey("boxerA_round7") as? NSNumber
            fightDetailViewController.boxerB_round7 = selectedFight.valueForKey("boxerB_round7") as? NSNumber
            fightDetailViewController.boxerA_round8 = selectedFight.valueForKey("boxerA_round8") as? NSNumber
            fightDetailViewController.boxerB_round8 = selectedFight.valueForKey("boxerB_round8") as? NSNumber
            fightDetailViewController.boxerA_round9 = selectedFight.valueForKey("boxerA_round9") as? NSNumber
            fightDetailViewController.boxerB_round9 = selectedFight.valueForKey("boxerB_round9") as? NSNumber
            fightDetailViewController.boxerA_round10 = selectedFight.valueForKey("boxerA_round10") as? NSNumber
            fightDetailViewController.boxerB_round10 = selectedFight.valueForKey("boxerB_round10") as? NSNumber
            fightDetailViewController.boxerA_round11 = selectedFight.valueForKey("boxerA_round11") as? NSNumber
            fightDetailViewController.boxerB_round11 = selectedFight.valueForKey("boxerB_round11") as? NSNumber
            fightDetailViewController.boxerA_round12 = selectedFight.valueForKey("boxerA_round12") as? NSNumber
            fightDetailViewController.boxerB_round12 = selectedFight.valueForKey("boxerB_round12") as? NSNumber
            fightDetailViewController.thisFight = selectedFight
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fights.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let fightCell:FightTableViewCell? = fightTableView.dequeueReusableCellWithIdentifier("fightCell") as? FightTableViewCell
     
        if let fightIndexPath = indexPath as NSIndexPath? {
            var data: NSManagedObject = fights[fightIndexPath.row] as NSManagedObject
            var rounds = data.valueForKeyPath("rounds") as? NSNumber
            var boxerA_totalScore = data.valueForKeyPath("boxerA_totalScore") as? NSNumber
            var boxerB_totalScore = data.valueForKeyPath("boxerB_totalScore") as? NSNumber
            
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
            fightCell?.labelBoxerATotal.text = "\(boxerA_totalScore!)"
            fightCell?.labelBoxerBTotal.text = "\(boxerB_totalScore!)"

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
                context.deleteObject(fights[indexPath.row] as NSManagedObject)
                fights.removeAtIndex(indexPath.row)
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
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
        labelInQuestion.tintColor = UIColor .whiteColor()
        labelInQuestion.alpha = 0.800
    }

    func drawLogo(#frame: CGRect) {
        //// Color Declarations
        let color0 = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1.000)
        let color2 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

        var shapePath = UIBezierPath()
        shapePath.moveToPoint(CGPointMake(frame.minX + 43.07, frame.minY + 86.51))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 46.66, frame.minY + 87), controlPoint1: CGPointMake(frame.minX + 44.16, frame.minY + 86.73), controlPoint2: CGPointMake(frame.minX + 45.36, frame.minY + 86.9))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 62.32, frame.minY + 84.91), controlPoint1: CGPointMake(frame.minX + 55.3, frame.minY + 87.9), controlPoint2: CGPointMake(frame.minX + 62.32, frame.minY + 84.91))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 60.7, frame.minY + 95.09), controlPoint1: CGPointMake(frame.minX + 62.32, frame.minY + 84.91), controlPoint2: CGPointMake(frame.minX + 61.78, frame.minY + 92.1))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 48.82, frame.minY + 97.49), controlPoint1: CGPointMake(frame.minX + 59.89, frame.minY + 96.59), controlPoint2: CGPointMake(frame.minX + 56.38, frame.minY + 97.49))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 36.67, frame.minY + 95.09), controlPoint1: CGPointMake(frame.minX + 41.26, frame.minY + 97.49), controlPoint2: CGPointMake(frame.minX + 38.02, frame.minY + 96.59))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 35.08, frame.minY + 85.37), controlPoint1: CGPointMake(frame.minX + 35.95, frame.minY + 94.3), controlPoint2: CGPointMake(frame.minX + 35.23, frame.minY + 90.23))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 22.09, frame.minY + 68.43), controlPoint1: CGPointMake(frame.minX + 31.58, frame.minY + 84.06), controlPoint2: CGPointMake(frame.minX + 26.48, frame.minY + 81.09))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 26.68, frame.minY + 55.24), controlPoint1: CGPointMake(frame.minX + 18.58, frame.minY + 58.54), controlPoint2: CGPointMake(frame.minX + 24.52, frame.minY + 55.24))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 31.54, frame.minY + 70.82), controlPoint1: CGPointMake(frame.minX + 27.22, frame.minY + 62.73), controlPoint2: CGPointMake(frame.minX + 30.19, frame.minY + 69.92))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 29.11, frame.minY + 53.14), controlPoint1: CGPointMake(frame.minX + 30.46, frame.minY + 68.13), controlPoint2: CGPointMake(frame.minX + 29.11, frame.minY + 56.44))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 48.28, frame.minY + 37.56), controlPoint1: CGPointMake(frame.minX + 29.38, frame.minY + 41.76), controlPoint2: CGPointMake(frame.minX + 32.89, frame.minY + 37.56))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 66.91, frame.minY + 53.14), controlPoint1: CGPointMake(frame.minX + 63.67, frame.minY + 37.56), controlPoint2: CGPointMake(frame.minX + 66.91, frame.minY + 41.76))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 61.24, frame.minY + 82.21), controlPoint1: CGPointMake(frame.minX + 66.91, frame.minY + 63.93), controlPoint2: CGPointMake(frame.minX + 65.56, frame.minY + 77.41))
        shapePath.addCurveToPoint(CGPointMake(frame.minX + 43.07, frame.minY + 86.51), controlPoint1: CGPointMake(frame.minX + 59.31, frame.minY + 84.34), controlPoint2: CGPointMake(frame.minX + 49.7, frame.minY + 86.18))
        shapePath.closePath()
        shapePath.miterLimit = 4;
        
        shapePath.usesEvenOddFillRule = true;
        
        color0.setFill()
        shapePath.fill()
        
        
        
        
        //// Rectangle 2 Drawing
        let rectangle2Rect = CGRectMake(frame.minX + 90.95, frame.minY + 45, 200, 52)
        let rectangle2Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        rectangle2Style.alignment = NSTextAlignment.Left
        
        let rectangle2FontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight", size: 40)!, NSForegroundColorAttributeName: color2, NSParagraphStyleAttributeName: rectangle2Style]
        
        "Fight".drawInRect(rectangle2Rect, withAttributes: rectangle2FontAttributes)
        
        
        //// Rectangle 4 Drawing
        let rectangle4Rect = CGRectMake(frame.minX + 182.91, frame.minY + 43, 172.09, 56)
        let rectangle4Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy()as! NSMutableParagraphStyle
        rectangle4Style.alignment = NSTextAlignment.Left
        
        let rectangle4FontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 40)!, NSForegroundColorAttributeName: color2, NSParagraphStyleAttributeName: rectangle4Style]
        
        "Scores".drawInRect(rectangle4Rect, withAttributes: rectangle4FontAttributes)
    }

    

}


