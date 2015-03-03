//
//  FightDetailViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class FightDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelBoxerA:     UILabel!
    @IBOutlet weak var labelBoxerB:     UILabel!
    @IBOutlet weak var labelBoxerA_totalScore:     UILabel!
    @IBOutlet weak var labelBoxerB_totalScore:     UILabel!
    @IBOutlet weak var labelRounds:     UILabel!
    @IBOutlet weak var labelFightDate:  UILabel!
    @IBOutlet weak var labelNotes:      UILabel!
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
    
    var boxerA: String?
    var boxerB: String?
    var rounds: String?
    var date:   String?
    var notes:  String?
    var boxerA_round1: String?
    var boxerA_round2: String?
    var boxerA_round3: String?
    var boxerA_round4: String?
    var boxerA_round5: String?
    var boxerA_round6: String?
    var boxerA_round7: String?
    var boxerA_round8: String?
    var boxerA_round9: String?
    var boxerA_round10: String?
    var boxerA_round11: String?
    var boxerA_round12: String?
    var boxerA_totalScore: String?
    var boxerB_round1: String?
    var boxerB_round2: String?
    var boxerB_round3: String?
    var boxerB_round4: String?
    var boxerB_round5: String?
    var boxerB_round6: String?
    var boxerB_round7: String?
    var boxerB_round8: String?
    var boxerB_round9: String?
    var boxerB_round10: String?
    var boxerB_round11: String?
    var boxerB_round12: String?
    var boxerB_totalScore: String?
    
    var thisFight: NSManagedObject!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Scorecard"
        self.view.backgroundColor = UIColor .blackColor()
        
        labelBoxerA.text = boxerA
        labelBoxerB.text = boxerB
        labelRounds.text = "\(rounds!) Rounds"
        labelFightDate.text = date
        labelBoxerA_totalScore.text = boxerA_totalScore
        labelBoxerB_totalScore.text = boxerB_totalScore
        
        var noScore = "-"
        
        if boxerA_round1 == "0" {
            labelBoxerA1.text = noScore
        } else {
            labelBoxerA1.text = boxerA_round1
        }
        if boxerA_round2 == "0" {
            labelBoxerA2.text = noScore
        } else {
            labelBoxerA2.text = boxerA_round2
        }
        if boxerA_round3 == "0" {
            labelBoxerA3.text = noScore
        } else {
            labelBoxerA3.text = boxerA_round3
        }
        if boxerA_round4 == "0" {
            labelBoxerA4.text = noScore
        } else {
            labelBoxerA4.text = boxerA_round4
        }
        if boxerA_round5 == "0" {
            labelBoxerA5.text = noScore
        } else {
            labelBoxerA5.text = boxerA_round5
        }
        if boxerA_round6 == "0" {
            labelBoxerA6.text = noScore
        } else {
            labelBoxerA6.text = boxerA_round6
        }
        if boxerA_round7 == "0" {
            labelBoxerA7.text = noScore
        } else {
            labelBoxerA7.text = boxerA_round7
        }
        if boxerA_round8 == "0" {
            labelBoxerA8.text = noScore
        } else {
            labelBoxerA8.text = boxerA_round8
        }
        if boxerA_round9 == "0" {
            labelBoxerA9.text = noScore
        } else {
            labelBoxerA9.text = boxerA_round9
        }
        if boxerA_round10 == "0" {
            labelBoxerA10.text = noScore
        } else {
            labelBoxerA10.text = boxerA_round10
        }
        if boxerA_round11 == "0" {
            labelBoxerA11.text = noScore
        } else {
            labelBoxerA11.text = boxerA_round11
        }
        if boxerA_round12 == "0" {
            labelBoxerA12.text = noScore
        } else {
            labelBoxerA12.text = boxerA_round12
        }
        
        // Boxer B Labels 
        if boxerB_round1 == "0" {
            labelBoxerB1.text = noScore
        } else {
            labelBoxerB1.text = boxerB_round1
        }
        if boxerB_round2 == "0" {
            labelBoxerB2.text = noScore
        } else {
            labelBoxerB2.text = boxerB_round2
        }
        if boxerB_round3 == "0" {
            labelBoxerB3.text = noScore
        } else {
            labelBoxerB3.text = boxerB_round3
        }
        if boxerB_round4 == "0" {
            labelBoxerB4.text = noScore
        } else {
            labelBoxerB4.text = boxerB_round4
        }
        if boxerB_round5 == "0" {
            labelBoxerB5.text = noScore
        } else {
            labelBoxerB5.text = boxerB_round5
        }
        if boxerB_round6 == "0" {
            labelBoxerB6.text = noScore
        } else {
            labelBoxerB6.text = boxerB_round6
        }
        if boxerB_round7 == "0" {
            labelBoxerB7.text = noScore
        } else {
            labelBoxerB7.text = boxerB_round7
        }
        if boxerB_round8 == "0" {
            labelBoxerB8.text = noScore
        } else {
            labelBoxerB8.text = boxerB_round8
        }
        if boxerB_round9 == "0" {
            labelBoxerB9.text = noScore
        } else {
            labelBoxerB9.text = boxerB_round9
        }
        if boxerB_round10 == "0" {
            labelBoxerB10.text = noScore
        } else {
            labelBoxerB10.text = boxerB_round10
        }
        if boxerB_round11 == "0" {
            labelBoxerB11.text = noScore
        } else {
            labelBoxerB11.text = boxerB_round11
        }
        if boxerB_round12 == "0" {
            labelBoxerB12.text = noScore
        } else {
            labelBoxerB12.text = boxerB_round12
        }


        
        
        if notes != nil {
            labelNotes.text = notes
        } else {
            labelNotes.text = "There are currently no notes for this fight."
        }
        
        // Scrollview
        scrollView.userInteractionEnabled = true
        scrollView.indicatorStyle = .Black
        view.addSubview(scrollView)
        
        // Adding swipe back to previous page
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        redButton(buttonUpdateScorecard)
        standardLabel(labelBoxerA_totalScore)
        standardLabel(labelBoxerB_totalScore)
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
    
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("User swiped Right")
                self.navigationController?.popToRootViewControllerAnimated(true)
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func shareTapped(sender: AnyObject) {
        let textToShare = "Here's how I scored \(boxerA!) vs \(boxerB!) #boxing"
        
        // Generate the screenshot
        UIGraphicsBeginImageContext(view.frame.size)
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
    
    
    

    /*
    // MARK: - Navigation
    */
    
    
    // Segue for Updating Scorecard
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Specify specific segue, prevents nil
        if segue.identifier == "scorecardSegue" {
            
            let scorecardViewController: EditFightViewController = segue.destinationViewController as! EditFightViewController

            // Pass data through to see item page
            scorecardViewController.boxerA = boxerA
            scorecardViewController.boxerB = boxerB
            scorecardViewController.notes = notes
            scorecardViewController.rounds = rounds
            scorecardViewController.date = date

            var defaultValue = "0"
            scorecardViewController.boxerA_totalScore = boxerA_totalScore ?? defaultValue
            scorecardViewController.boxerB_totalScore = boxerB_totalScore ?? defaultValue
            scorecardViewController.boxerA_round1 = boxerA_round1 ?? defaultValue
            scorecardViewController.boxerA_round2 = boxerA_round2 ?? defaultValue
            scorecardViewController.boxerA_round3 = boxerA_round3 ?? defaultValue
            scorecardViewController.boxerA_round4 = boxerA_round4 ?? defaultValue
            scorecardViewController.boxerA_round5 = boxerA_round5 ?? defaultValue
            scorecardViewController.boxerA_round6 = boxerA_round6 ?? defaultValue
            scorecardViewController.boxerA_round7 = boxerA_round7 ?? defaultValue
            scorecardViewController.boxerA_round8 = boxerA_round8 ?? defaultValue
            scorecardViewController.boxerA_round9 = boxerA_round9 ?? defaultValue
            scorecardViewController.boxerA_round10 = boxerA_round10 ?? defaultValue
            scorecardViewController.boxerA_round11 = boxerA_round11 ?? defaultValue
            scorecardViewController.boxerA_round12 = boxerA_round12 ?? defaultValue
            scorecardViewController.boxerB_round1 = boxerB_round1 ?? defaultValue
            scorecardViewController.boxerB_round2 = boxerB_round2 ?? defaultValue
            scorecardViewController.boxerB_round3 = boxerB_round3 ?? defaultValue
            scorecardViewController.boxerB_round4 = boxerB_round4 ?? defaultValue
            scorecardViewController.boxerB_round5 = boxerB_round5 ?? defaultValue
            scorecardViewController.boxerB_round6 = boxerB_round6 ?? defaultValue
            scorecardViewController.boxerB_round7 = boxerB_round7 ?? defaultValue
            scorecardViewController.boxerB_round8 = boxerB_round8 ?? defaultValue
            scorecardViewController.boxerB_round9 = boxerB_round9 ?? defaultValue
            scorecardViewController.boxerB_round10 = boxerB_round10 ?? defaultValue
            scorecardViewController.boxerB_round11 = boxerB_round11 ?? defaultValue
            scorecardViewController.boxerB_round12 = boxerB_round12 ?? defaultValue
            scorecardViewController.thisFight = thisFight
        }
    }
    
    func redButton(buttonInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 85/255, green: 23/255, blue: 24/255, alpha: 0.8)
        var lightBurgundyColor = UIColor(red: 65/255, green: 23/255, blue: 24/255, alpha: 0.9)
        
        buttonInQuestion.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        buttonInQuestion.titleLabel?.textColor = UIColor .whiteColor()
        buttonInQuestion.backgroundColor = burgundyColor
        
        buttonInQuestion.addTarget(self, action: "activeButton:", forControlEvents: .TouchCancel)
        
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
    
    func setRdScore(roundScore: String) {
        var defaultvalue = "-"
        
        
    }

}
