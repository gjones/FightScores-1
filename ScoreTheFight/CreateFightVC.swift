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

    var managedObjectContext : NSManagedObjectContext?
    var _fight : Fight?
    var fight : Fight
        {
            if _fight == nil
            {
                _fight = NSEntityDescription.insertNewObjectForEntityForName("Fight", inManagedObjectContext: self.managedObjectContext!) as? Fight
            }
            return _fight!
    }
    
    func doSomethingWithDate(date: NSDate) {
        
        
        // Set fight date as Date
        fight.date = date
        
        
        // Set button title
        var rawDate = date as NSDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "dd MMMM, yyyy"
        let timestamp = dateFormatter.stringFromDate(rawDate)
        
        if fight.date == NSDate() {
            buttonDate.setTitle("Today", forState: .Normal)
        } else {
            buttonDate.setTitle(timestamp, forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Scorecard"
    
        buttonAddFight.setTitle("Add This Fight", forState: .Normal)
        
        textFieldBoxerA.delegate = self
        textFieldBoxerB.delegate = self
        
        leftNavButton()
    
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

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func leftNavButton() {
        // hide default navigation bar button item
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        let buttonBack: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        buttonBack.frame = CGRectMake(0, 0, 40, 40)
        buttonBack.setImage(UIImage(named:"button_back2.png"), forState: UIControlState.Normal)
        buttonBack.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0)
        buttonBack.addTarget(self, action: "leftNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonBack)
        
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
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
        
        // Save our context
        managedObjectContext!.save(nil)
        
        performSegueWithIdentifier("unwindToFightList", sender: self)
    }
    
    // Styling 
    
    func circularButton(buttonInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        
        buttonInQuestion.layer.cornerRadius = 20
        buttonInQuestion.clipsToBounds = true
        buttonInQuestion.backgroundColor = whiteColor
        buttonInQuestion.layer.borderWidth = 1
        buttonInQuestion.layer.borderColor = borderColor.CGColor
        
        buttonInQuestion.addTarget(self, action: "activeButton:", forControlEvents: .TouchUpInside)
        
    }
    
    func activeButton(sender: UIButton!) {
        
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        buttonRd4.backgroundColor = whiteColor
        buttonRd4.layer.borderColor = borderColor.CGColor
        buttonRd6.backgroundColor = whiteColor
        buttonRd6.layer.borderColor = borderColor.CGColor
        buttonRd8.backgroundColor = whiteColor
        buttonRd8.layer.borderColor = borderColor.CGColor
        buttonRd10.backgroundColor = whiteColor
        buttonRd10.layer.borderColor = borderColor.CGColor
        buttonRd12.backgroundColor = whiteColor
        buttonRd12.layer.borderColor = borderColor.CGColor
        
        sender.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        sender.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.6).CGColor
        sender.resignFirstResponder()
    }
    
}
