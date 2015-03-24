//
//  FightDetailViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class FightDetailVC: UIViewController, UpdateFightDetailDelegate {
    
    var fightDate = FightDate()
    var globalFunctions = globalHeaderFunctions()
    var fight : Fight? {
        didSet {
            updateFightInfo()
        }
    }
    
    @IBOutlet weak var scrollView:              UIScrollView!
    @IBOutlet weak var labelBoxerA:             UILabel!
    @IBOutlet weak var labelBoxerB:             UILabel!
    @IBOutlet weak var labelBoxerA_totalScore:  UILabel!
    @IBOutlet weak var labelBoxerB_totalScore:  UILabel!
    @IBOutlet weak var labelRounds:             UILabel!
    @IBOutlet weak var labelFightDate:          UILabel!
    @IBOutlet weak var labelNotes:              UILabel!
    @IBOutlet weak var labelNotesTitle:         UILabel!
    @IBOutlet weak var buttonUpdateScorecard:   UIButton!
    
    // Set Round Labels
    @IBOutlet weak var label1:  UILabel!
    @IBOutlet weak var label2:  UILabel!
    @IBOutlet weak var label3:  UILabel!
    @IBOutlet weak var label4:  UILabel!
    @IBOutlet weak var label5:  UILabel!
    @IBOutlet weak var label6:  UILabel!
    @IBOutlet weak var label7:  UILabel!
    @IBOutlet weak var label8:  UILabel!
    @IBOutlet weak var label9:  UILabel!
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
        
    }

    func updateFightInfo() {
        
        if fight != nil && isViewLoaded() {
            
            // Set Label Values
            labelBoxerA.text =              fight!.boxerA
            labelBoxerB.text =              fight!.boxerB
            labelRounds.text =              "\(fight!.rounds) Rounds"
            labelFightDate.text =           fightDate.dateCalculator(fight!.date)
            labelBoxerA_totalScore.text =   "\(fight!.boxerA_totalScore)"
            labelBoxerB_totalScore.text =   "\(fight!.boxerB_totalScore)"
            labelNotesTitle.text =          "Fight Notes"
            labelBoxerA1.text =             "\(fight!.boxerA_round1)"
            labelBoxerA2.text =             "\(fight!.boxerA_round2)"
            labelBoxerA3.text =             "\(fight!.boxerA_round3)"
            labelBoxerA4.text =             "\(fight!.boxerA_round4)"
            labelBoxerA5.text =             "\(fight!.boxerA_round5)"
            labelBoxerA6.text =             "\(fight!.boxerA_round6)"
            labelBoxerA7.text =             "\(fight!.boxerA_round7)"
            labelBoxerA8.text =             "\(fight!.boxerA_round8)"
            labelBoxerA9.text =             "\(fight!.boxerA_round9)"
            labelBoxerA10.text =             "\(fight!.boxerA_round10)"
            labelBoxerA11.text =             "\(fight!.boxerA_round11)"
            labelBoxerA12.text =             "\(fight!.boxerA_round12)"
            labelBoxerB1.text =             "\(fight!.boxerB_round1)"
            labelBoxerB2.text =             "\(fight!.boxerB_round2)"
            labelBoxerB3.text =             "\(fight!.boxerB_round3)"
            labelBoxerB4.text =             "\(fight!.boxerB_round4)"
            labelBoxerB5.text =             "\(fight!.boxerB_round5)"
            labelBoxerB6.text =             "\(fight!.boxerB_round6)"
            labelBoxerB7.text =             "\(fight!.boxerB_round7)"
            labelBoxerB8.text =             "\(fight!.boxerB_round8)"
            labelBoxerB9.text =             "\(fight!.boxerB_round9)"
            labelBoxerB10.text =             "\(fight!.boxerB_round10)"
            labelBoxerB11.text =             "\(fight!.boxerB_round11)"
            labelBoxerB12.text =             "\(fight!.boxerB_round12)"
            
            if fight?.notes == "" {
                labelNotes.text = "There are currently no notes for this fight."
            } else {
                labelNotes.text = fight!.notes
            }
            
            if labelBoxerA_totalScore.text  == "0" {
                buttonUpdateScorecard.setTitle("Begin Scoring This Fight", forState: .Normal)
            } else {
                buttonUpdateScorecard.setTitle("Continue Scoring This Fight", forState: .Normal)
            }
            
            setNoOfRounds()
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        updateFightInfo()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "header_bg.png"), forBarMetrics: UIBarMetrics.Default)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fight Overview"
        
        // Scrollview
        scrollView.userInteractionEnabled = true
        scrollView.indicatorStyle = .Black
        view.addSubview(scrollView)
        
        // Custom Nav Items
        globalFunctions.leftButton(self, image: "button_back2.png")
        globalFunctions.rightButton(self, image: "button_share.png")
        
        // Adding swipe back to previous page
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        

    }
    
    // Right Swipe Functionality
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
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
    func rightNavButtonClick(sender: UIButton) {
        let textToShare = "Here's how I scored \(fight!.boxerA) vs \(fight!.boxerB) #boxing"
        
        // Generate the screenshot
        if let keyWindow = UIApplication.sharedApplication().keyWindow {
            let layer = keyWindow.layer
            let scale = UIScreen.mainScreen().scale
            
            UIGraphicsBeginImageContextWithOptions(layer.frame.size, view.opaque, scale);
            layer.renderInContext(UIGraphicsGetCurrentContext())
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
    }
    
    func leftNavButtonClick(sender:UIButton!) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // Segue for Updating Scorecard
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Specify specific segue, prevents nil
        if segue.identifier == "scorecardSegue" {
            
            let navController = segue.destinationViewController as UINavigationController
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.25 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            }
            
            let scorecardVC = navController.topViewController as ScorecardVC
            scorecardVC.delegate = self
            scorecardVC.fight = fight! as Fight
        }
    }
    
    func setNoOfRounds() {
        if fight?.rounds == 10 {
            nonApplicableRound(labelBoxerA11)
            nonApplicableRound(labelBoxerA12)
            nonApplicableRound(labelBoxerB11)
            nonApplicableRound(labelBoxerB12)
        }
        
        if fight?.rounds == 8 {
            nonApplicableRound(labelBoxerA9)
            nonApplicableRound(labelBoxerA10)
            nonApplicableRound(labelBoxerB9)
            nonApplicableRound(labelBoxerB10)
            nonApplicableRound(labelBoxerA11)
            nonApplicableRound(labelBoxerA12)
            nonApplicableRound(labelBoxerB11)
            nonApplicableRound(labelBoxerB12)
        }
        
        if fight?.rounds == 6 {
            nonApplicableRound(labelBoxerA7)
            nonApplicableRound(labelBoxerA8)
            nonApplicableRound(labelBoxerB7)
            nonApplicableRound(labelBoxerB8)
            nonApplicableRound(labelBoxerA9)
            nonApplicableRound(labelBoxerA10)
            nonApplicableRound(labelBoxerB9)
            nonApplicableRound(labelBoxerB10)
            nonApplicableRound(labelBoxerA11)
            nonApplicableRound(labelBoxerA12)
            nonApplicableRound(labelBoxerB11)
            nonApplicableRound(labelBoxerB12)
        }
        
        if fight?.rounds == 4 {
            nonApplicableRound(labelBoxerA5)
            nonApplicableRound(labelBoxerA6)
            nonApplicableRound(labelBoxerB5)
            nonApplicableRound(labelBoxerB6)
            nonApplicableRound(labelBoxerA7)
            nonApplicableRound(labelBoxerA8)
            nonApplicableRound(labelBoxerB7)
            nonApplicableRound(labelBoxerB8)
            nonApplicableRound(labelBoxerA9)
            nonApplicableRound(labelBoxerA10)
            nonApplicableRound(labelBoxerB9)
            nonApplicableRound(labelBoxerB10)
            nonApplicableRound(labelBoxerA11)
            nonApplicableRound(labelBoxerA12)
            nonApplicableRound(labelBoxerB11)
            nonApplicableRound(labelBoxerB12)
        }
    }
    
    func nonApplicableRound(labelInQuestion: UILabel) {
        var transparentColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        labelInQuestion.textColor = transparentColor
        labelInQuestion.text = "-"
    }
}