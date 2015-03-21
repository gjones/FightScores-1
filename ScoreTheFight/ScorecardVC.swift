//
//  EditFightViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData


protocol UpdateFightDetailDelegate {
    func fightInformationUpdated(A1:String, A2:String, A3:String, A4:String, A5:String, A6:String, A7:String, A8:String, A9:String,A10:String, A11:String, A12:String, B1:String, B2:String, B3:String, B4:String, B5:String, B6:String, B7:String, B8:String, B9:String,B10:String, B11:String, B12:String, Atot:String, Btot:String, Notes:String)
}

class ScorecardVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var fight : Fight? {
        didSet {
            updateFightInfo()
        }
    }

    @IBOutlet weak var scrollView:      UIScrollView!
    @IBOutlet weak var roundsView:      UIView!
    @IBOutlet weak var contentView:     UIView!
    @IBOutlet weak var labelBoxerA:     UILabel!
    @IBOutlet weak var labelBoxerB:     UILabel!
    @IBOutlet weak var labelNotes:      UILabel!
    @IBOutlet weak var labelvs:         UILabel!
    
    @IBOutlet weak var textViewNotes: UITextView!
    
    @IBOutlet weak var labelATotalScore: UILabel!
    @IBOutlet weak var labelBTotalScore: UILabel!
    
    @IBOutlet weak var scorecardButton: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    
    // Score Page
    @IBOutlet weak var labelBoxerName: UILabel!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    
    
    
    @IBOutlet weak var roundsViewHeightConstraint: NSLayoutConstraint!

    var delegate:UpdateFightDetailDelegate? = nil

    func updateFightInfo() {
        if fight != nil && isViewLoaded() {
            
            labelBoxerA.text = fight!.boxerA
            labelBoxerB.text = fight!.boxerB
            labelATotalScore.text = "\(fight!.boxerA_totalScore)"
            labelBTotalScore.text = "\(fight!.boxerB_totalScore)"
            labelNotes.text = "Fight Notes"
            textViewNotes.text = fight!.notes
            fight!.winner = "none"
        
            buttonA1.setTitle("\(fight!.boxerA_round1)", forState: .Normal)
            buttonA2.setTitle("\(fight!.boxerA_round2)", forState: .Normal)
            buttonA3.setTitle("\(fight!.boxerA_round3)", forState: .Normal)
            buttonA4.setTitle("\(fight!.boxerA_round4)", forState: .Normal)
            buttonA5.setTitle("\(fight!.boxerA_round5)", forState: .Normal)
            buttonA6.setTitle("\(fight!.boxerA_round6)", forState: .Normal)
            buttonA7.setTitle("\(fight!.boxerA_round7)", forState: .Normal)
            buttonA8.setTitle("\(fight!.boxerA_round8)", forState: .Normal)
            buttonA9.setTitle("\(fight!.boxerA_round9)", forState: .Normal)
            buttonA10.setTitle("\(fight!.boxerA_round10)", forState: .Normal)
            buttonA11.setTitle("\(fight!.boxerA_round11)", forState: .Normal)
            buttonA12.setTitle("\(fight!.boxerA_round12)", forState: .Normal)
            buttonB1.setTitle("\(fight!.boxerB_round1)", forState: .Normal)
            buttonB2.setTitle("\(fight!.boxerB_round2)", forState: .Normal)
            buttonB3.setTitle("\(fight!.boxerB_round3)", forState: .Normal)
            buttonB4.setTitle("\(fight!.boxerB_round4)", forState: .Normal)
            buttonB5.setTitle("\(fight!.boxerB_round5)", forState: .Normal)
            buttonB6.setTitle("\(fight!.boxerB_round6)", forState: .Normal)
            buttonB7.setTitle("\(fight!.boxerB_round7)", forState: .Normal)
            buttonB8.setTitle("\(fight!.boxerB_round8)", forState: .Normal)
            buttonB9.setTitle("\(fight!.boxerB_round9)", forState: .Normal)
            buttonB10.setTitle("\(fight!.boxerB_round10)", forState: .Normal)
            buttonB11.setTitle("\(fight!.boxerB_round11)", forState: .Normal)
            buttonB12.setTitle("\(fight!.boxerB_round12)", forState: .Normal)
            scorecardButton.setTitle("Submit Your Scores", forState: .Normal)
            
            if fight!.rounds == 4 {
                viewRd5.hidden = true
                viewRd6.hidden = true
                viewRd7.hidden = true
                viewRd8.hidden = true
                viewRd9.hidden = true
                viewRd10.hidden = true
                viewRd11.hidden = true
                viewRd12.hidden = true
                roundsViewHeightConstraint.constant = 200
            }
            
            if fight!.rounds == 6 {
                viewRd7.hidden = true
                viewRd8.hidden = true
                viewRd9.hidden = true
                viewRd10.hidden = true
                viewRd11.hidden = true
                viewRd12.hidden = true
                roundsViewHeightConstraint.constant = 280
                
            }
            
            if fight!.rounds == 8 {
                viewRd9.hidden = true
                viewRd10.hidden = true
                viewRd11.hidden = true
                viewRd12.hidden = true
                roundsViewHeightConstraint.constant = 360
                
            }
            
            if fight!.rounds == 10 {
                viewRd11.hidden = true
                viewRd12.hidden = true
                roundsViewHeightConstraint.constant = 440
            }
            
            if fight!.rounds == 12 {
                
            }

        }
    }
    
    var lastButtonPressed: String?
    @IBOutlet weak var viewScoring: UIVisualEffectView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.alpha = 1.0
        
        updateFightInfo()
    }
    
    // Round One
    @IBOutlet weak var viewRd1: UIView!
    @IBOutlet weak var buttonA1: UIButton!
    @IBAction func buttonA1(sender: UIButton) {
        lastButtonPressed = "a1"
        showChooseScore()
    }
    @IBOutlet weak var buttonB1: UIButton!
    @IBAction func buttonB1(sender: UIButton) {
        lastButtonPressed = "b1"
        showChooseScore()
    }
    
    // Round Two
    @IBOutlet weak var viewRd2: UIView!
    @IBOutlet weak var buttonA2: UIButton!
    @IBAction func buttonA2(sender: UIButton) {
        lastButtonPressed = "a2"
        showChooseScore()
    }
    @IBOutlet weak var buttonB2: UIButton!
    @IBAction func buttonB2(sender: UIButton) {
        lastButtonPressed = "b2"
        showChooseScore()
    }
    
    // Round Three
    @IBOutlet weak var viewRd3: UIView!
    @IBOutlet weak var buttonA3: UIButton!
    @IBAction func buttonA3(sender: UIButton) {
        lastButtonPressed = "a3"
        showChooseScore()
    }
    @IBOutlet weak var buttonB3: UIButton!
    @IBAction func buttonB3(sender: UIButton) {
        lastButtonPressed = "b3"
        showChooseScore()
    }
    
    // Round Four
    @IBOutlet weak var viewRd4: UIView!
    @IBOutlet weak var buttonA4: UIButton!
    @IBAction func buttonA4(sender: UIButton) {
        lastButtonPressed = "a4"
        showChooseScore()
    }
    @IBOutlet weak var buttonB4: UIButton!
    @IBAction func buttonB4(sender: UIButton) {
        lastButtonPressed = "b4"
        showChooseScore()
    }
    
    // Round Five
    @IBOutlet weak var viewRd5: UIView!
    @IBOutlet weak var buttonA5: UIButton!
    @IBAction func buttonA5(sender: UIButton) {
        lastButtonPressed = "a5"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB5: UIButton!
    @IBAction func buttonB5(sender: UIButton) {
        lastButtonPressed = "b5"
        showChooseScore()
    }
    
    // Round Six
    @IBOutlet weak var viewRd6: UIView!
    @IBOutlet weak var buttonA6: UIButton!
    @IBAction func buttonA6(sender: UIButton) {
        lastButtonPressed = "a6"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB6: UIButton!
    @IBAction func buttonB6(sender: UIButton) {
        lastButtonPressed = "b6"
        showChooseScore()
    }
    
    // Round Seven
    @IBOutlet weak var viewRd7: UIView!
    @IBOutlet weak var buttonA7: UIButton!
    @IBAction func buttonA7(sender: UIButton) {
        lastButtonPressed = "a7"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB7: UIButton!
    @IBAction func buttonB7(sender: UIButton) {
        lastButtonPressed = "b7"
        showChooseScore()
    }
    
    // Round Eight
    @IBOutlet weak var viewRd8: UIView!
    @IBOutlet weak var buttonA8: UIButton!
    @IBAction func buttonA8(sender: UIButton) {
        lastButtonPressed = "a8"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB8: UIButton!
    @IBAction func buttonB8(sender: UIButton) {
        lastButtonPressed = "b8"
        showChooseScore()
    }
    
    // Round Nine
    @IBOutlet weak var viewRd9: UIView!
    @IBOutlet weak var buttonA9: UIButton!
    @IBAction func buttonA9(sender: UIButton) {
        lastButtonPressed = "a9"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB9: UIButton!
    @IBAction func buttonB9(sender: UIButton) {
        lastButtonPressed = "b9"
        showChooseScore()
    }
    
    // Round Ten
    @IBOutlet weak var viewRd10: UIView!
    @IBOutlet weak var buttonA10: UIButton!
    @IBAction func buttonA10(sender: UIButton) {
        lastButtonPressed = "a10"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB10: UIButton!
    @IBAction func buttonB10(sender: UIButton) {
        lastButtonPressed = "b10"
        showChooseScore()
    }
    
    // Round Eleven
    @IBOutlet weak var viewRd11: UIView!
    @IBOutlet weak var buttonA11: UIButton!
    @IBAction func buttonA11(sender: UIButton) {
        lastButtonPressed = "a11"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB11: UIButton!
    @IBAction func buttonB11(sender: UIButton) {
        lastButtonPressed = "b11"
        showChooseScore()
    }

    // Round Twelve
    @IBOutlet weak var viewRd12: UIView!
    @IBOutlet weak var buttonA12: UIButton!
    @IBAction func buttonA12(sender: UIButton) {
        lastButtonPressed = "a12"
        showChooseScore()
    }
    
    @IBOutlet weak var buttonB12: UIButton!
    @IBAction func buttonB12(sender: UIButton) {
        lastButtonPressed = "b12"
        showChooseScore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Scorecard"
        
        // Hide the scoring view 
        self.viewScoring.alpha = 0.0

        
        textViewNotes.delegate = self
        
        leftNavButton()
        rightNavButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func scorecardButton(sender: AnyObject) {
        finishup()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
    }

    func textViewDidBeginEditing(textView: UITextView) {
        animateViewMoving(true, moveValue: 180)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        animateViewMoving(false, moveValue: 180)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    func calculateScores() {
        
        // Round 1
        var A1 = buttonA1.titleLabel!.text?.toInt()
        var B1 = buttonB1.titleLabel!.text?.toInt()
        
        // Round 2
        var A2 = buttonA2.titleLabel!.text?.toInt()
        var B2 = buttonB2.titleLabel!.text?.toInt()
        
        // Round 3
        var A3 = buttonA3.titleLabel!.text?.toInt()
        var B3 = buttonB3.titleLabel!.text?.toInt()
        
        // Round 4
        var A4 = buttonA4.titleLabel!.text?.toInt()
        var B4 = buttonB4.titleLabel!.text?.toInt()
        
        // Round 5
        var A5 = buttonA5.titleLabel!.text?.toInt()
        var B5 = buttonB5.titleLabel!.text?.toInt()
        
        // Round 6
        var A6 = buttonA6.titleLabel!.text?.toInt()
        var B6 = buttonB6.titleLabel!.text?.toInt()
        
        // Round 7
        var A7 = buttonA7.titleLabel!.text?.toInt()
        var B7 = buttonB7.titleLabel!.text?.toInt()
        
        // Round 8
        var A8 = buttonA8.titleLabel!.text?.toInt()
        var B8 = buttonB8.titleLabel!.text?.toInt()
        
        // Round 9
        var A9 = buttonA9.titleLabel!.text?.toInt()
        var B9 = buttonB9.titleLabel!.text?.toInt()
        
        // Round 10
        var A10 = buttonA10.titleLabel!.text?.toInt()
        var B10 = buttonB10.titleLabel!.text?.toInt()

        // Round 11
        var A11 = buttonA11.titleLabel!.text?.toInt()
        var B11 = buttonB11.titleLabel!.text?.toInt()
        
        // Round 12
        var A12 = buttonA12.titleLabel!.text?.toInt()
        var B12 = buttonB12.titleLabel!.text?.toInt()
        
        var totalScoreA = A1! + A2! + A3! + A4! + A5! + A6! + A7! + A8! + A9! + A10! + A11! + A12!

        var totalScoreB = B1! + B2! + B3! + B4! + B5! + B6! + B7! + B8! + B9! + B10! + B11! + B12!
        
        labelATotalScore.text = "\(totalScoreA)"
        labelBTotalScore.text = "\(totalScoreB)"

    }
    
    func finishup() {
        
        fight!.boxerA_round1 = buttonA1.titleLabel!.text!.toInt()!
        fight!.boxerB_round1 = buttonB1.titleLabel!.text!.toInt()!
        fight!.boxerA_round2 = buttonA2.titleLabel!.text!.toInt()!
        fight!.boxerB_round2 = buttonB2.titleLabel!.text!.toInt()!
        fight!.boxerA_round3 = buttonA3.titleLabel!.text!.toInt()!
        fight!.boxerB_round3 = buttonB3.titleLabel!.text!.toInt()!
        fight!.boxerA_round4 = buttonA4.titleLabel!.text!.toInt()!
        fight!.boxerB_round4 = buttonB4.titleLabel!.text!.toInt()!
        fight!.boxerA_round5 = buttonA5.titleLabel!.text!.toInt()!
        fight!.boxerB_round5 = buttonB5.titleLabel!.text!.toInt()!
        fight!.boxerA_round6 = buttonA6.titleLabel!.text!.toInt()!
        fight!.boxerB_round6 = buttonB6.titleLabel!.text!.toInt()!
        fight!.boxerA_round7 = buttonA7.titleLabel!.text!.toInt()!
        fight!.boxerB_round7 = buttonB7.titleLabel!.text!.toInt()!
        fight!.boxerA_round8 = buttonA8.titleLabel!.text!.toInt()!
        fight!.boxerB_round8 = buttonB8.titleLabel!.text!.toInt()!
        fight!.boxerA_round9 = buttonA9.titleLabel!.text!.toInt()!
        fight!.boxerB_round9 = buttonB9.titleLabel!.text!.toInt()!
        fight!.boxerA_round10 = buttonA10.titleLabel!.text!.toInt()!
        fight!.boxerB_round10 = buttonB10.titleLabel!.text!.toInt()!
        fight!.boxerA_round11 = buttonA11.titleLabel!.text!.toInt()!
        fight!.boxerB_round11 = buttonB11.titleLabel!.text!.toInt()!
        fight!.boxerA_round12 = buttonA12.titleLabel!.text!.toInt()!
        fight!.boxerB_round12 = buttonB12.titleLabel!.text!.toInt()!
        
        fight!.boxerA_totalScore = labelATotalScore.text!.toInt()!
        fight!.boxerB_totalScore = labelBTotalScore.text!.toInt()!
        
        fight!.notes = textViewNotes.text!
        
        // Save our context
        var context = fight!.managedObjectContext
        context?.save(nil)
        
        // Move on
        if (delegate != nil) {
            var A1 = buttonA1.titleLabel!.text
            var B1 = buttonB1.titleLabel!.text
            var A2 = buttonA2.titleLabel!.text
            var B2 = buttonB2.titleLabel!.text
            var A3 = buttonA3.titleLabel!.text
            var B3 = buttonB3.titleLabel!.text
            var A4 = buttonA4.titleLabel!.text
            var B4 = buttonB4.titleLabel!.text
            var A5 = buttonA5.titleLabel!.text
            var B5 = buttonB5.titleLabel!.text
            var A6 = buttonA6.titleLabel!.text
            var B6 = buttonB6.titleLabel!.text
            var A7 = buttonA7.titleLabel!.text
            var B7 = buttonB7.titleLabel!.text
            var A8 = buttonA8.titleLabel!.text
            var B8 = buttonB8.titleLabel!.text
            var A9 = buttonA9.titleLabel!.text
            var B9 = buttonB9.titleLabel!.text
            var A10 = buttonA10.titleLabel!.text
            var B10 = buttonB10.titleLabel!.text
            var A11 = buttonA11.titleLabel!.text
            var B11 = buttonB11.titleLabel!.text
            var A12 = buttonA12.titleLabel!.text
            var B12 = buttonB12.titleLabel!.text
            var Atot = labelATotalScore.text
            var Btot = labelBTotalScore.text
            var Notes = textViewNotes.text
            delegate!.fightInformationUpdated(A1!, A2: A2!, A3: A3!, A4: A4!, A5: A5!, A6: A6!, A7: A7!, A8: A8!, A9: A9!, A10: A10!, A11: A11!, A12: A12!, B1: B1!, B2: B2!, B3: B3!, B4: B4!, B5: B5!, B6: B6!, B7: B7!, B8: B8!, B9: B9!, B10: B10!, B11: B11!, B12: B12!, Atot: Atot!, Btot: Btot!, Notes: Notes!)
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    func hideChooseScore() {
        UIView.animateWithDuration(0.3, animations: {
            self.viewScoring.alpha = 0.0
            self.navigationController?.navigationBar.alpha = 1.0
            UIApplication.sharedApplication().statusBarHidden = false
        })
        
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.250 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.calculateScores()
        }
    }

    func showChooseScore() {
        UIView.animateWithDuration(0.3, animations: {
            self.viewScoring.alpha = 1.0
            self.navigationController?.navigationBar.alpha = 0.0
            self.prefersStatusBarHidden()
            UIApplication.sharedApplication().statusBarHidden = true
        })
    }
    
    @IBAction func buttonTen(sender: UIButton) {
        setTitles("10")
        hideChooseScore()
    }
    
    @IBAction func buttonNine(sender: UIButton) {
        setTitles("9")
        hideChooseScore()
    }

    @IBAction func buttonEight(sender: UIButton) {
        setTitles("8")
        hideChooseScore()
    }
    
    @IBAction func buttonSeven(sender: UIButton) {
        setTitles("7")
        hideChooseScore()
    }

    @IBAction func buttonSix(sender: UIButton) {
        setTitles("6")
        hideChooseScore()
    }

    @IBAction func buttonZero(sender: UIButton) {
        setTitles("0")
        hideChooseScore()
    }
    
    func setTitles(pointsNumber: String) {
        if lastButtonPressed! == "a1" {
            buttonA1.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b1" {
            buttonB1.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a2" {
            buttonA2.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b2" {
            buttonB2.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a3" {
            buttonA3.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b3" {
            buttonB3.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a4" {
            buttonA4.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b4" {
            buttonB4.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a5" {
            buttonA5.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b5" {
            buttonB5.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a6" {
            buttonA6.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b6" {
            buttonB6.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a7" {
            buttonA7.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b7" {
            buttonB7.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a8" {
            buttonA8.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b8" {
            buttonB8.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a9" {
            buttonA9.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b9" {
            buttonB9.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a10" {
            buttonA10.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b10" {
            buttonB10.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a11" {
            buttonA11.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b11" {
            buttonB11.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "a12" {
            buttonA12.setTitle(pointsNumber, forState: .Normal)
        } else if lastButtonPressed! == "b12" {
            buttonB12.setTitle(pointsNumber, forState: .Normal)
        }
        
    }
    
    func leftNavButton() {
        // hide default navigation bar button item
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        let buttonBack: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        buttonBack.frame = CGRectMake(0, 0, 40, 40)
        buttonBack.setImage(UIImage(named:"button_confirm.png"), forState: UIControlState.Normal)
        buttonBack.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0)
        buttonBack.addTarget(self, action: "leftNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonBack)
        
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
    }
    
    func leftNavButtonClick(sender:UIButton!) {
        finishup()
    }
    
    func rightNavButton() {
        // hide default navigation bar button item
        self.navigationItem.rightBarButtonItem = nil;
        
        let buttonShare: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        var xCoordinate = (self.view.frame.size.width - 20)
        buttonShare.frame = CGRectMake(0, xCoordinate, 40, 40)
        buttonShare.setImage(UIImage(named:"button_close.png"), forState: UIControlState.Normal)
        buttonShare.imageEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)
        buttonShare.addTarget(self, action: "rightNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonShare)
        
        self.navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: false)
    }
    
    func rightNavButtonClick(sender:UIButton!) {
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
