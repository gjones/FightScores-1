//
//  FightDetailViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class FightDetailViewController: UIViewController, UpdateFightDetailDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelBoxerA:     UILabel!
    @IBOutlet weak var labelBoxerB:     UILabel!
    @IBOutlet weak var labelBoxerA_totalScore:     UILabel!
    @IBOutlet weak var labelBoxerB_totalScore:     UILabel!
    @IBOutlet weak var labelRounds:     UILabel!
    @IBOutlet weak var labelFightDate:  UILabel!
    @IBOutlet weak var labelNotes:      UILabel!
    @IBOutlet weak var labelNotesTitle:      UILabel!
    @IBOutlet weak var buttonUpdateScorecard: UIButton!
    
    // Set Round Labels
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!

    // Set Boxer A Labels
    @IBOutlet weak var labelBoxerA1: UILabel!
    @IBOutlet weak var labelBoxerA2: UILabel!
    @IBOutlet weak var labelBoxerA3: UILabel!
    @IBOutlet weak var labelBoxerA4: UILabel!
    @IBOutlet weak var labelBoxerA5: UILabel!
    @IBOutlet weak var labelBoxerA6: UILabel!
    @IBOutlet weak var labelBoxerA7: UILabel!
    @IBOutlet weak var labelBoxerA8: UILabel!
    @IBOutlet weak var labelBoxerA9: UILabel!
    @IBOutlet weak var labelBoxerA10: UILabel!
    @IBOutlet weak var labelBoxerA11: UILabel!
    @IBOutlet weak var labelBoxerA12: UILabel!

    // Set Boxer A Labels
    @IBOutlet weak var labelBoxerB1: UILabel!
    @IBOutlet weak var labelBoxerB2: UILabel!
    @IBOutlet weak var labelBoxerB3: UILabel!
    @IBOutlet weak var labelBoxerB4: UILabel!
    @IBOutlet weak var labelBoxerB5: UILabel!
    @IBOutlet weak var labelBoxerB6: UILabel!
    @IBOutlet weak var labelBoxerB7: UILabel!
    @IBOutlet weak var labelBoxerB8: UILabel!
    @IBOutlet weak var labelBoxerB9: UILabel!
    @IBOutlet weak var labelBoxerB10: UILabel!
    @IBOutlet weak var labelBoxerB11: UILabel!
    @IBOutlet weak var labelBoxerB12: UILabel!
    
    
    // Set Object Types
    var boxerA:             String?
    var boxerB:             String?
    var rounds:             NSNumber?
    var date:               String?
    var notes:              String?
    var boxerA_round1:      NSNumber?
    var boxerA_round2:      NSNumber?
    var boxerA_round3:      NSNumber?
    var boxerA_round4:      NSNumber?
    var boxerA_round5:      NSNumber?
    var boxerA_round6:      NSNumber?
    var boxerA_round7:      NSNumber?
    var boxerA_round8:      NSNumber?
    var boxerA_round9:      NSNumber?
    var boxerA_round10:     NSNumber?
    var boxerA_round11:     NSNumber?
    var boxerA_round12:     NSNumber?
    var boxerA_totalScore:  NSNumber?
    var boxerB_round1:      NSNumber?
    var boxerB_round2:      NSNumber?
    var boxerB_round3:      NSNumber?
    var boxerB_round4:      NSNumber?
    var boxerB_round5:      NSNumber?
    var boxerB_round6:      NSNumber?
    var boxerB_round7:      NSNumber?
    var boxerB_round8:      NSNumber?
    var boxerB_round9:      NSNumber?
    var boxerB_round10:     NSNumber?
    var boxerB_round11:     NSNumber?
    var boxerB_round12:     NSNumber?
    var boxerB_totalScore:  NSNumber?
    
    var thisFight: NSManagedObject!
    
    func fightInformationUpdated(A1: String, A2: String, A3: String, A4: String, A5: String, A6: String, A7: String, A8: String, A9: String, A10: String, A11: String, A12: String, B1: String, B2: String, B3: String, B4: String, B5: String, B6: String, B7: String, B8: String, B9: String, B10: String, B11: String, B12: String, Atot: String, Btot: String, Notes: String) {
        self.labelBoxerA1.text = A1
        self.labelBoxerA2.text = A2
        self.labelBoxerA3.text = A3
        self.labelBoxerA4.text = A4
        self.labelBoxerA5.text = A5
        self.labelBoxerA6.text = A6
        self.labelBoxerA7.text = A7
        self.labelBoxerA8.text = A8
        self.labelBoxerA9.text = A9
        self.labelBoxerA10.text = A10
        self.labelBoxerA11.text = A11
        self.labelBoxerA12.text = A12
        self.labelBoxerB1.text =  B1
        self.labelBoxerB2.text =  B2
        self.labelBoxerB3.text =  B3
        self.labelBoxerB4.text =  B4
        self.labelBoxerB5.text =  B5
        self.labelBoxerB6.text =  B6
        self.labelBoxerB7.text =  B7
        self.labelBoxerB8.text =  B8
        self.labelBoxerB9.text =  B9
        self.labelBoxerB10.text = B10
        self.labelBoxerB11.text = B11
        self.labelBoxerB12.text = B12
        self.labelBoxerA_totalScore.text = Atot
        self.labelBoxerB_totalScore.text = Btot
        self.labelNotes.text = Notes
        
        if Atot == "0" {
            buttonUpdateScorecard.setTitle("Begin Scoring This Fight", forState: .Normal)
        } else {
            buttonUpdateScorecard.setTitle("Continue Scoring This Fight", forState: .Normal)
        }
        
        // Reference to our app delegate
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        context.save(nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fight Overview"
        
        
        // Set Label Values
        labelBoxerA.text =              boxerA
        labelBoxerB.text =              boxerB
        labelRounds.text =              "\(rounds!) Rounds"
        labelFightDate.text =           date
        labelBoxerA_totalScore.text =   "\(boxerA_totalScore!)"
        labelBoxerB_totalScore.text =   "\(boxerB_totalScore!)"
        labelNotesTitle.text =          "Fight Notes"
        labelNotes.text =               notes
    
        recalculateScores()
        
        if labelBoxerA_totalScore.text  == "0" {
            buttonUpdateScorecard.setTitle("Begin Scoring This Fight", forState: .Normal)
        } else {
            buttonUpdateScorecard.setTitle("Continue Scoring This Fight", forState: .Normal)
        }
        
        // Scrollview
        scrollView.userInteractionEnabled = true
        scrollView.indicatorStyle = .Black
        view.addSubview(scrollView)
        
        // Custom Nav Items
        leftNavButton()
        rightNavButton()
        
        // Adding swipe back to previous page
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        // Set Styling
        standardLabel(labelBoxerA_totalScore)
        standardLabel(labelBoxerB_totalScore)
        standardLabel(labelNotes)
        smallLabel(labelNotesTitle)
        smallLabel(labelFightDate)
        smallLabel(labelRounds)
        softWhiteLabel(label1)
        softWhiteLabel(label2)
        softWhiteLabel(label3)
        softWhiteLabel(label4)
        softWhiteLabel(label5)
        softWhiteLabel(label6)
        softWhiteLabel(label7)
        softWhiteLabel(label8)
        softWhiteLabel(label9)
        softWhiteLabel(label10)
        softWhiteLabel(label11)
        softWhiteLabel(label12)
        borderedLabel(labelBoxerA1)
        borderedLabel(labelBoxerA2)
        borderedLabel(labelBoxerA3)
        borderedLabel(labelBoxerA4)
        borderedLabel(labelBoxerA5)
        borderedLabel(labelBoxerA6)
        borderedLabel(labelBoxerA7)
        borderedLabel(labelBoxerA8)
        borderedLabel(labelBoxerA9)
        borderedLabel(labelBoxerA10)
        borderedLabel(labelBoxerA11)
        borderedLabel(labelBoxerA12)
        borderedLabel(labelBoxerB1)
        borderedLabel(labelBoxerB2)
        borderedLabel(labelBoxerB3)
        borderedLabel(labelBoxerB4)
        borderedLabel(labelBoxerB5)
        borderedLabel(labelBoxerB6)
        borderedLabel(labelBoxerB7)
        borderedLabel(labelBoxerB8)
        borderedLabel(labelBoxerB9)
        borderedLabel(labelBoxerB10)
        borderedLabel(labelBoxerB11)
        borderedLabel(labelBoxerB12)
        
    }
    
    // Right Swipe Functionality
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                println("User swiped Right")
                self.navigationController?.popToRootViewControllerAnimated(true)

            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Sharing Functionality
    func shareTapped(sender: UIButton) {
        let textToShare = "Here's how I scored \(boxerA!) vs \(boxerB!) #boxing"
        
        // Generate the screenshot
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        var screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let imageToShare = screenshot {
            let objectsToShare = [textToShare, imageToShare]
            let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            // Excluded Activities Code
            activityViewController.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
            
        } else {
            let objectsToShare = [textToShare]
            let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            // Excluded Activities Code
            activityViewController.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
                
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
    }
    
    // Custom Navigation Controls
    func leftNavButton() {
        
        // hide default navigation bar button item
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        let buttonBack: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        buttonBack.frame = CGRectMake(0, 0, 40, 40)
        buttonBack.setImage(UIImage(named:"button_back.png"), forState: UIControlState.Normal)
        buttonBack.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0)
        buttonBack.addTarget(self, action: "leftNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonBack)
        
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
    }
    
    func leftNavButtonClick(sender:UIButton!) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func rightNavButton() {
        // hide default navigation bar button item
        self.navigationItem.rightBarButtonItem = nil;
        
        let buttonShare: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        var xCoordinate = (self.view.frame.size.width - 20)
        buttonShare.frame = CGRectMake(0, xCoordinate, 40, 40)
        buttonShare.setImage(UIImage(named:"button_share.png"), forState: UIControlState.Normal)
        buttonShare.imageEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)
        buttonShare.addTarget(self, action: "shareTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonShare)
        
        self.navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: false)
    }
    

    /*
    // MARK: - Navigation
    */
    
    
    // Segue for Updating Scorecard
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Specify specific segue, prevents nil
        if segue.identifier == "scorecardSegue" {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.25 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.navigationController?.navigationBar.alpha = 0.0
            }
            let navController = segue.destinationViewController as! UINavigationController
            
            let scorecardViewController = navController.topViewController as! EditFightViewController
            scorecardViewController.delegate = self


            // Pass data through to see item page
            scorecardViewController.boxerA = boxerA
            scorecardViewController.boxerB = boxerB
            scorecardViewController.notes = self.labelNotes.text
            scorecardViewController.rounds = rounds
            scorecardViewController.date = date

            scorecardViewController.boxerA_totalScore = self.labelBoxerA_totalScore.text?.toInt()
            scorecardViewController.boxerB_totalScore = self.labelBoxerB_totalScore.text?.toInt()
            scorecardViewController.boxerA_round1 = self.labelBoxerA1.text?.toInt()
            scorecardViewController.boxerA_round2 = self.labelBoxerA2.text?.toInt()
            scorecardViewController.boxerA_round3 = self.labelBoxerA3.text?.toInt()
            scorecardViewController.boxerA_round4 = self.labelBoxerA4.text?.toInt()
            scorecardViewController.boxerA_round5 = self.labelBoxerA5.text?.toInt()
            scorecardViewController.boxerA_round6 = self.labelBoxerA6.text?.toInt()
            scorecardViewController.boxerA_round7 = self.labelBoxerA7.text?.toInt()
            scorecardViewController.boxerA_round8 = self.labelBoxerA8.text?.toInt()
            scorecardViewController.boxerA_round9 = self.labelBoxerA9.text?.toInt()
            scorecardViewController.boxerA_round10 = self.labelBoxerA10.text?.toInt()
            scorecardViewController.boxerA_round11 = self.labelBoxerA11.text?.toInt()
            scorecardViewController.boxerA_round12 = self.labelBoxerA12.text?.toInt()
            scorecardViewController.boxerB_round1 = self.labelBoxerB1.text?.toInt()
            scorecardViewController.boxerB_round2 = self.labelBoxerB2.text?.toInt()
            scorecardViewController.boxerB_round3 = self.labelBoxerB3.text?.toInt()
            scorecardViewController.boxerB_round4 = self.labelBoxerB4.text?.toInt()
            scorecardViewController.boxerB_round5 = self.labelBoxerB5.text?.toInt()
            scorecardViewController.boxerB_round6 = self.labelBoxerB6.text?.toInt()
            scorecardViewController.boxerB_round7 = self.labelBoxerB7.text?.toInt()
            scorecardViewController.boxerB_round8 = self.labelBoxerB8.text?.toInt()
            scorecardViewController.boxerB_round9 = self.labelBoxerB9.text?.toInt()
            scorecardViewController.boxerB_round10 = self.labelBoxerB10.text?.toInt()
            scorecardViewController.boxerB_round11 = self.labelBoxerB11.text?.toInt()
            scorecardViewController.boxerB_round12 = self.labelBoxerB12.text?.toInt()
            scorecardViewController.thisFight = thisFight
        }
    }
    
    func recalculateScores() {
        labelBoxerA1.text =             "\(boxerA_round1!)"
        labelBoxerA2.text =             "\(boxerA_round2!)"
        labelBoxerA3.text =             "\(boxerA_round3!)"
        labelBoxerA4.text =             "\(boxerA_round4!)"
        labelBoxerA5.text =             "\(boxerA_round5!)"
        labelBoxerA6.text =             "\(boxerA_round6!)"
        labelBoxerA7.text =             "\(boxerA_round7!)"
        labelBoxerA8.text =             "\(boxerA_round8!)"
        labelBoxerA9.text =             "\(boxerA_round9!)"
        labelBoxerA10.text =            "\(boxerA_round10!)"
        labelBoxerA11.text =            "\(boxerA_round11!)"
        labelBoxerA12.text =            "\(boxerA_round12!)"
        labelBoxerB1.text =             "\(boxerB_round1!)"
        labelBoxerB2.text =             "\(boxerB_round2!)"
        labelBoxerB3.text =             "\(boxerB_round3!)"
        labelBoxerB4.text =             "\(boxerB_round4!)"
        labelBoxerB5.text =             "\(boxerB_round5!)"
        labelBoxerB6.text =             "\(boxerB_round6!)"
        labelBoxerB7.text =             "\(boxerB_round7!)"
        labelBoxerB8.text =             "\(boxerB_round8!)"
        labelBoxerB9.text =             "\(boxerB_round9!)"
        labelBoxerB10.text =            "\(boxerB_round10!)"
        labelBoxerB11.text =            "\(boxerB_round11!)"
        labelBoxerB12.text =            "\(boxerB_round12!)"
    }
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
    }
    
    func softWhiteLabel(labelInQuestion: UILabel) {
        var offWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 14)
        labelInQuestion.textColor = UIColor .whiteColor()
        labelInQuestion.backgroundColor = offWhiteColor
        labelInQuestion.layer.borderColor = borderColor
        labelInQuestion.layer.borderWidth = 0.5
    }
    
    func borderedLabel(labelInQuestion: UILabel) {
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 14)
        labelInQuestion.textColor = UIColor .whiteColor()
        labelInQuestion.layer.borderColor = borderColor
        labelInQuestion.layer.borderWidth = 0.5
    }
    
    
    func smallLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        labelInQuestion.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    }
}