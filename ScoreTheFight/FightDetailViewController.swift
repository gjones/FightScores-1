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

}
