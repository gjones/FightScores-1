//
//  AddFightViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class AddFightViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {

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
    
    @IBOutlet weak var labelBoxerA: UILabel!
    @IBOutlet weak var labelBoxerB: UILabel!
    @IBOutlet weak var labelRounds: UILabel!

    var boxerA: String?
    var boxerB: String?
    var rounds: NSNumber?
    var date:   NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Scorecard"
    
        labelBoxerA.text = "Name of First Boxer"
        labelBoxerB.text = "Name of Second Boxer"
        labelRounds.text = "Number of Scheduled Rounds"
        
        textFieldBoxerA.delegate = self
        textFieldBoxerB.delegate = self
        
        leftNavButton()
    
        // Apply Styles
        circularButton(buttonRd4)
        circularButton(buttonRd6)
        circularButton(buttonRd8)
        circularButton(buttonRd10)
        circularButton(buttonRd12)
        softWhiteTextField(textFieldBoxerA)
        softWhiteTextField(textFieldBoxerB)
        standardLabel(labelBoxerA)
        standardLabel(labelBoxerB)
        standardLabel(labelRounds)
        
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
                print("User swiped Right")
                self.navigationController?.popToRootViewControllerAnimated(true)
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
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
        labelInQuestion.tintColor = UIColor .whiteColor()
    }
    
    // Rounds Logic
    @IBAction func buttonRd4(sender: AnyObject) {
        rounds = 4
    }
    @IBAction func buttonRd6(sender: AnyObject) {
        rounds = 6
    }
    @IBAction func buttonRd8(sender: AnyObject) {
        rounds = 8
    }
    @IBAction func buttonRd10(sender: AnyObject) {
        rounds = 10
    }
    @IBAction func buttonRd12(sender: AnyObject) {
        rounds = 12
    }
    
    
    func submitFight() {
        // Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Fight", inManagedObjectContext: context)
        
        // Create instance of our data model and initialize
        var newFight = FightModel(entity: entity!, insertIntoManagedObjectContext: context)
        
        // Map our properties

        if textFieldBoxerA.text == "" {
            newFight.boxerA = "Boxer A"
        } else {
            newFight.boxerA = textFieldBoxerA.text ?? "Boxer A"
        }
        if textFieldBoxerB.text == "" {
            newFight.boxerB = "Boxer B"
        } else {
            newFight.boxerB = textFieldBoxerB.text
        }
        
        newFight.date = NSDate()
        if rounds == nil {
            newFight.rounds = 12
        } else {
            newFight.rounds = rounds!
        }

        // Save our context
        context.save(nil)

        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    

}
