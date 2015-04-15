//
//  AddFightViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class CreateFightVC: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonStartScoring: UIButton!
    
    @IBOutlet weak var textFieldBoxerA: UITextField!
    @IBOutlet weak var textFieldBoxerB: UITextField!
    
    @IBOutlet weak var buttonAddFight: UIButton!
    @IBOutlet weak var buttonRd4: UIButton!
    @IBOutlet weak var buttonRd6: UIButton!
    @IBOutlet weak var buttonRd8: UIButton!
    @IBOutlet weak var buttonRd10: UIButton!
    @IBOutlet weak var buttonRd12: UIButton!
    @IBOutlet weak var buttonDate: UIButton!
    
    @IBOutlet weak var labelBoxerA: UILabel!
    @IBOutlet weak var labelBoxerB: UILabel!
    @IBOutlet weak var labelRounds: UILabel!
    
    var fightDate = FightDate()
    var globalFunctions = globalHeaderFunctions()
    var fightDatePassed: NSDate!
    var managedObjectContext : NSManagedObjectContext?
    
    var _fight : Fight?
    var fight : Fight {
        if _fight == nil {
            _fight = NSEntityDescription.insertNewObjectForEntityForName("Fight", inManagedObjectContext: self.managedObjectContext!) as? Fight
        }
        return _fight!
    }
    
    func doSomethingWithDate(date: NSDate) {
        fight.date = date
        fightDatePassed = date
        
        buttonDate.setTitle(fightDate.shortDateCalculator(date), forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Scorecard"
    
        buttonAddFight.setTitle("Add This Fight", forState: .Normal)
        
        textFieldBoxerA.delegate = self
        textFieldBoxerB.delegate = self
        
        globalFunctions.leftButton(self, image: "button_back2.png")
        
        // Apply Styles
        circularButton(buttonRd4)
        circularButton(buttonRd6)
        circularButton(buttonRd8)
        circularButton(buttonRd10)
        circularButton(buttonRd12)
        
        scrollView.userInteractionEnabled = true
        scrollView.indicatorStyle = .Black
        view.addSubview(scrollView)
        
        // Adding swipe back to previous page
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                performSegueWithIdentifier("unwindToFightList", sender: self)
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addFightButton(sender: AnyObject) {
        submitFight()
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func leftNavButtonClick(sender:UIButton!) {
       performSegueWithIdentifier("unwindToFightList", sender: self)
    }
    
    
    // Rounds Logic
    
    var setRounds: NSNumber = 12.0
    
    @IBAction func buttonRd4(sender: AnyObject) {
        setRounds = 4
    }
    @IBAction func buttonRd6(sender: AnyObject) {
        setRounds = 6
    }
    @IBAction func buttonRd8(sender: AnyObject) {
        setRounds = 8
    }
    @IBAction func buttonRd10(sender: AnyObject) {
        setRounds = 10
    }
    @IBAction func buttonRd12(sender: AnyObject) {
        setRounds = 12
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFightDate" {
            if let dateView = segue.destinationViewController as? FightDateVC {
                dateView.onDateAvailable = {[weak self]
                    (date) in
                    if let weakSelf = self {
                        weakSelf.doSomethingWithDate(date)
                    }
                }
                if fightDatePassed != nil {
                    dateView.fightDate = fightDatePassed
                }
                println(fightDatePassed)
            }
        }
    }

    
    
    func submitFight() {
        
        // Map our properties
        if textFieldBoxerA.text == "" {
            fight.boxerA = "Boxer A"
        } else {
            fight.boxerA = textFieldBoxerA.text
        }
        if textFieldBoxerB.text == "" {
            fight.boxerB = "Boxer B"
        } else {
            fight.boxerB = textFieldBoxerB.text
        }
        
        fight.rounds = setRounds ?? 12
        
        var setContext = self.fightDate.establishDateContext(fight.date)
        fight.context = setContext
        
        // Save our context
        managedObjectContext!.save(nil)

        performSegueWithIdentifier("unwindToFightList", sender: self)
    }
    
    // Styling 
    
    func circularButton(buttonInQuestion: UIButton) {
        
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        
        buttonInQuestion.layer.cornerRadius = 0.5 * buttonInQuestion.bounds.size.width
        buttonInQuestion.backgroundColor = whiteColor
        buttonInQuestion.layer.borderWidth = 1
        buttonInQuestion.layer.borderColor = borderColor.CGColor
        buttonInQuestion.titleLabel!.font = UIFont (name: "HelveticaNeue-Light", size: 18)
        
        buttonInQuestion.addTarget(self, action: "activeButton:", forControlEvents: .TouchUpInside)
        
    }
    
    func activeButton(sender: UIButton!) {
        
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let otherButtons = [buttonRd4, buttonRd6, buttonRd8, buttonRd10, buttonRd12]
        
        for (index, button) in enumerate(otherButtons) {
            button.backgroundColor = whiteColor
            button.layer.borderColor = borderColor.CGColor
        }
        
        sender.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        sender.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.6).CGColor
        sender.resignFirstResponder()
    }
    
}
