//
//  EditFightViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class EditFightViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView:      UIScrollView!
    @IBOutlet weak var roundsView:      UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var labelBoxerA:     UILabel!
    @IBOutlet weak var labelBoxerB:     UILabel!
    @IBOutlet weak var labelNotes:      UILabel!
    @IBOutlet weak var labelvs:         UILabel!
    
    @IBOutlet weak var textFieldNotes:  UITextField!
    
    @IBOutlet weak var labelATotalScore: UILabel!
    @IBOutlet weak var labelBTotalScore: UILabel!
    
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var scorecardButton: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    
    var boxerA:             String?
    var boxerB:             String?
    var rounds:             String?
    var date:               String?
    var notes:              String?
    var boxerA_round1:      String?
    var boxerA_round2:      String?
    var boxerA_round3:      String?
    var boxerA_round4:      String?
    var boxerA_round5:      String?
    var boxerA_round6:      String?
    var boxerA_round7:      String?
    var boxerA_round8:      String?
    var boxerA_round9:      String?
    var boxerA_round10:     String?
    var boxerA_round11:     String?
    var boxerA_round12:     String?
    var boxerA_totalScore:  String?
    var boxerB_round1:      String?
    var boxerB_round2:      String?
    var boxerB_round3:      String?
    var boxerB_round4:      String?
    var boxerB_round5:      String?
    var boxerB_round6:      String?
    var boxerB_round7:      String?
    var boxerB_round8:      String?
    var boxerB_round9:      String?
    var boxerB_round10:     String?
    var boxerB_round11:     String?
    var boxerB_round12:     String?
    var boxerB_totalScore:  String?

    var thisFight: NSManagedObject!
    var lastButtonPressed: String?
    @IBOutlet weak var viewScoring: UIVisualEffectView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.alpha = 1.0
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

        self.title = "Update Scorecard"
        
        labelBoxerA.text = boxerA
        labelBoxerB.text = boxerB
        labelATotalScore.text = boxerA_totalScore
        labelBTotalScore.text = boxerB_totalScore
        
        textFieldNotes.delegate = self
        
        if notes != nil {
            textFieldNotes.text = notes
        }
        
        
        buttonA1.setTitle(boxerA_round1, forState: .Normal)
        buttonA2.setTitle(boxerA_round2, forState: .Normal)
        buttonA3.setTitle(boxerA_round3, forState: .Normal)
        buttonA4.setTitle(boxerA_round4, forState: .Normal)
        buttonA5.setTitle(boxerA_round5, forState: .Normal)
        buttonA6.setTitle(boxerA_round6, forState: .Normal)
        buttonA7.setTitle(boxerA_round7, forState: .Normal)
        buttonA8.setTitle(boxerA_round8, forState: .Normal)
        buttonA9.setTitle(boxerA_round9, forState: .Normal)
        buttonA10.setTitle(boxerA_round10, forState: .Normal)
        buttonA11.setTitle(boxerA_round11, forState: .Normal)
        buttonA12.setTitle(boxerA_round12, forState: .Normal)
        buttonB1.setTitle(boxerB_round1, forState: .Normal)
        buttonB2.setTitle(boxerB_round2, forState: .Normal)
        buttonB3.setTitle(boxerB_round3, forState: .Normal)
        buttonB4.setTitle(boxerB_round4, forState: .Normal)
        buttonB5.setTitle(boxerB_round5, forState: .Normal)
        buttonB6.setTitle(boxerB_round6, forState: .Normal)
        buttonB7.setTitle(boxerB_round7, forState: .Normal)
        buttonB8.setTitle(boxerB_round8, forState: .Normal)
        buttonB9.setTitle(boxerB_round9, forState: .Normal)
        buttonB10.setTitle(boxerB_round10, forState: .Normal)
        buttonB11.setTitle(boxerB_round11, forState: .Normal)
        buttonB12.setTitle(boxerB_round12, forState: .Normal)
   
        
        if rounds == "4" {
            viewRd5.hidden = true
            viewRd6.hidden = true
            viewRd7.hidden = true
            viewRd8.hidden = true
            viewRd9.hidden = true
            viewRd10.hidden = true
            viewRd11.hidden = true
            viewRd12.hidden = true
            roundsView.backgroundColor = UIColor .redColor()
            contentView.backgroundColor = UIColor .greenColor()
            

            
        }
        
        if rounds == "6" {
            viewRd7.hidden = true
            viewRd8.hidden = true
            viewRd9.hidden = true
            viewRd10.hidden = true
            viewRd11.hidden = true
            viewRd12.hidden = true

        }
        
        if rounds == "8" {
            viewRd9.hidden = true
            viewRd10.hidden = true
            viewRd11.hidden = true
            viewRd12.hidden = true

        }

        if rounds == "10" {
            viewRd11.hidden = true
            viewRd12.hidden = true
        }
        
        if rounds == "12" {
//            contentView.backgroundColor = UIColor .blueColor()
//            view.frame.size.height = 920
        }
        
        // Apply styles
        standardLabel(labelBoxerA)
        standardLabel(labelBoxerB)
        standardLabel(labelvs)
        standardLabel(labelNotes)
        smallLabel(labelATotalScore)
        smallLabel(labelBTotalScore)
        softWhiteTextField(textFieldNotes)
        offSoftWhiteButton(buttonA1)
        softWhiteButton(buttonA2)
        offSoftWhiteButton(buttonA3)
        softWhiteButton(buttonA4)
        offSoftWhiteButton(buttonA5)
        softWhiteButton(buttonA6)
        offSoftWhiteButton(buttonA7)
        softWhiteButton(buttonA8)
        offSoftWhiteButton(buttonA9)
        softWhiteButton(buttonA10)
        offSoftWhiteButton(buttonA11)
        softWhiteButton(buttonA12)
        offSoftWhiteButton(buttonB1)
        softWhiteButton(buttonB2)
        offSoftWhiteButton(buttonB3)
        softWhiteButton(buttonB4)
        offSoftWhiteButton(buttonB5)
        softWhiteButton(buttonB6)
        offSoftWhiteButton(buttonB7)
        softWhiteButton(buttonB8)
        offSoftWhiteButton(buttonB9)
        softWhiteButton(buttonB10)
        offSoftWhiteButton(buttonB11)
        softWhiteButton(buttonB12)
        circularButton(buttonTen)
        circularButton(buttonNine)
        circularButton(buttonEight)
        circularButton(buttonSeven)
        circularButton(buttonSix)
        circularButton(buttonZero)
        
        self.viewScoring.alpha = 0.0

        leftNavButton()
        // Adding swipe back to previous page
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    func swiped(gesture: UIGestureRecognizer) {
        let previousViewController = self.storyboard?.instantiateViewControllerWithIdentifier("FightDetailViewController") as! FightDetailViewController
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                //self.navigationController?.popToViewController(previousViewController, animated: true)
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
    

    @IBAction func scorecardButton(sender: AnyObject) {
        
        // Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Fight", inManagedObjectContext: context)

        thisFight.setValue(textFieldNotes.text as String, forKey: "notes")
        thisFight.setValue(buttonA1.titleLabel!.text! as String, forKey: "boxerA_round1")
        thisFight.setValue(buttonB1.titleLabel!.text! as String, forKey: "boxerB_round1")
        thisFight.setValue(buttonA2.titleLabel!.text! as String, forKey: "boxerA_round2")
        thisFight.setValue(buttonB2.titleLabel!.text! as String, forKey: "boxerB_round2")
        thisFight.setValue(buttonA3.titleLabel!.text! as String, forKey: "boxerA_round3")
        thisFight.setValue(buttonB3.titleLabel!.text! as String, forKey: "boxerB_round3")
        thisFight.setValue(buttonA4.titleLabel!.text! as String, forKey: "boxerA_round4")
        thisFight.setValue(buttonB4.titleLabel!.text! as String, forKey: "boxerB_round4")
        thisFight.setValue(buttonA5.titleLabel!.text! as String, forKey: "boxerA_round5")
        thisFight.setValue(buttonB5.titleLabel!.text! as String, forKey: "boxerB_round5")
        thisFight.setValue(buttonA6.titleLabel!.text! as String, forKey: "boxerA_round6")
        thisFight.setValue(buttonB6.titleLabel!.text! as String, forKey: "boxerB_round6")
        thisFight.setValue(buttonA7.titleLabel!.text! as String, forKey: "boxerA_round7")
        thisFight.setValue(buttonB7.titleLabel!.text! as String, forKey: "boxerB_round7")
        thisFight.setValue(buttonA8.titleLabel!.text! as String, forKey: "boxerA_round8")
        thisFight.setValue(buttonB8.titleLabel!.text! as String, forKey: "boxerB_round8")
        thisFight.setValue(buttonA9.titleLabel!.text! as String, forKey: "boxerA_round9")
        thisFight.setValue(buttonB9.titleLabel!.text! as String, forKey: "boxerB_round9")
        thisFight.setValue(buttonA10.titleLabel!.text! as String, forKey: "boxerA_round10")
        thisFight.setValue(buttonB10.titleLabel!.text! as String, forKey: "boxerB_round10")
        thisFight.setValue(buttonA11.titleLabel!.text! as String, forKey: "boxerA_round11")
        thisFight.setValue(buttonB11.titleLabel!.text! as String, forKey: "boxerB_round11")
        thisFight.setValue(buttonA12.titleLabel!.text! as String, forKey: "boxerA_round12")
        thisFight.setValue(buttonB12.titleLabel!.text! as String, forKey: "boxerB_round12")
        thisFight.setValue(labelATotalScore.text! as String, forKey: "boxerA_totalScore")
        thisFight.setValue(labelBTotalScore.text! as String, forKey: "boxerB_totalScore")
    
        // Save our context
        context.save(nil)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
        
    }
    
    func calculateScores() {
        var defaultValue = "0"
        // Round 1
        var A1 = buttonA1.titleLabel!.text ?? defaultValue
        var A1Int = A1.toInt()
        var B1 = buttonB1.titleLabel!.text ?? defaultValue
        var B1Int = B1.toInt()
        
        // Round 2
        var A2 = buttonA2.titleLabel!.text
        var A2Int = ripString(A2!)
        var B2 = buttonB2.titleLabel!.text
        var B2Int = ripString(B2!)
        
        // Round 3
        var A3 = buttonA3.titleLabel!.text
        var A3Int = ripString(A3!)
        var B3 = buttonB3.titleLabel!.text
        var B3Int = ripString(B3!)
        
        // Round 4
        var A4 = buttonA4.titleLabel!.text
        var A4Int = ripString(A4!)
        var B4 = buttonB4.titleLabel!.text
        var B4Int = ripString(B4!)
        
        // Round 5
        var A5 = buttonA5.titleLabel!.text
        var A5Int = ripString(A5!)
        var B5 = buttonB5.titleLabel!.text
        var B5Int = ripString(B5!)
        
        // Round 6
        var A6 = buttonA6.titleLabel!.text
        var A6Int = ripString(A6!)
        var B6 = buttonB6.titleLabel!.text
        var B6Int = ripString(B6!)
        
        // Round 7
        var A7 = buttonA7.titleLabel!.text
        var A7Int = ripString(A7!)
        var B7 = buttonB7.titleLabel!.text
        var B7Int = ripString(B7!)
        
        // Round 8
        var A8 = buttonA8.titleLabel!.text
        var A8Int = ripString(A8!)
        var B8 = buttonB8.titleLabel!.text
        var B8Int = ripString(B8!)
        
        // Round 9
        var A9 = buttonA9.titleLabel!.text
        var A9Int = ripString(A9!)
        var B9 = buttonB9.titleLabel!.text
        var B9Int = ripString(B9!)
        
        // Round 10
        var A10 = buttonA10.titleLabel!.text
        var A10Int = ripString(A10!)
        var B10 = buttonB10.titleLabel!.text
        var B10Int = ripString(B10!)

        // Round 11
        var A11 = buttonA11.titleLabel!.text
        var A11Int = ripString(A11!)
        var B11 = buttonB11.titleLabel!.text
        var B11Int = ripString(B11!)
        
        // Round 12
        var A12 = buttonA12.titleLabel!.text
        var A12Int = ripString(A12!)
        var B12 = buttonB12.titleLabel!.text
        var B12Int = ripString(B12!)
        
        var totalScoreA = A1Int! + A2Int! + A3Int! + A4Int! + A5Int! + A6Int! + A7Int! + A8Int! + A9Int! + A10Int! + A11Int! + A12Int!
        var totalScoreB = B1Int! + B2Int! + B3Int! + B4Int! + B5Int! + B6Int! + B7Int! + B8Int! + B9Int! + B10Int! + B11Int! + B12Int!
        
        labelATotalScore.text = "\(totalScoreA)"
        labelBTotalScore.text = "\(totalScoreB)"

    }
    
    func ripString(roundVar: String) -> Int? {
        if roundVar.isEmpty {
            var roundVar = "0"
        }
        
        var score = roundVar.toInt()
        if score != nil {
            // Nothing
        } else {
            score = 0
        }
        
        return score
        
    }
    
    func hideChooseScore() {
        UIView.animateWithDuration(0.3, animations: {
            self.viewScoring.alpha = 0.0
            self.navigationController?.navigationBar.alpha = 1.0
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
    
    /// MARK: Styles 
    func softWhiteTextField(fieldInQuestion: UITextField) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        
        // fieldInQuestion.layer.cornerRadius = 4
        fieldInQuestion.textColor = UIColor .whiteColor()
        fieldInQuestion.backgroundColor = whiteColor
        fieldInQuestion.layer.borderWidth = 0.5
        fieldInQuestion.layer.borderColor = borderColor.CGColor
        fieldInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 14)   
    }

    func softWhiteButton(fieldInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.05)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.24)
        
        fieldInQuestion.backgroundColor = whiteColor
        fieldInQuestion.layer.borderWidth = 0.5
        fieldInQuestion.layer.borderColor = borderColor.CGColor
    }
    
    func offSoftWhiteButton(fieldInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.24)

        fieldInQuestion.backgroundColor = whiteColor
        fieldInQuestion.layer.borderWidth = 0.5
        fieldInQuestion.layer.borderColor = borderColor.CGColor
    }
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
    }

    func smallLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        labelInQuestion.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    }
    
    
    func circularButton(buttonInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        
        buttonInQuestion.layer.cornerRadius = 30
        buttonInQuestion.clipsToBounds = true
        buttonInQuestion.backgroundColor = whiteColor
        buttonInQuestion.layer.borderWidth = 1
        buttonInQuestion.layer.borderColor = borderColor.CGColor
        buttonInQuestion.tintColor = UIColor .whiteColor()
        buttonInQuestion.titleLabel!.font = UIFont (name: "HelveticaNeue-Light", size: 22)
        
    }

}
