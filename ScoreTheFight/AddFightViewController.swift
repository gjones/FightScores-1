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
    var rounds: String?
    var date:   NSDate?
    
    // Rounds Logic
    @IBAction func buttonRd4(sender: AnyObject) {
        rounds = "4"
        println("Rounds = \(rounds!)")
    }
    @IBAction func buttonRd6(sender: AnyObject) {
        rounds = "6"
        println("Rounds = \(rounds!)")
    }
    @IBAction func buttonRd8(sender: AnyObject) {
        rounds = "8"
        println("Rounds = \(rounds!)")
    }
    @IBAction func buttonRd10(sender: AnyObject) {
        rounds = "10"
        println("Rounds = \(rounds!)")
    }
    @IBAction func buttonRd12(sender: AnyObject) {
        rounds = "12"
        println("Rounds = \(rounds!)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Scorecard"
        
        labelBoxerA.text = "Name of First Boxer"
        labelBoxerB.text = "Name of Second Boxer"
        labelRounds.text = "Number of Scheduled Rounds"
        
        textFieldBoxerA.delegate = self
        textFieldBoxerB.delegate = self
        
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)

        buttonAddFight.layer.cornerRadius = 4
    
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
        redButton(buttonStartScoring)
        
        scrollView.userInteractionEnabled = true
        // scrollView.contentSize = CGSizeMake(0, 900)
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
        
        // Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Fight", inManagedObjectContext: context)
        
        // Create instance of our data model and initialize
        var newFight = FightModel(entity: entity!, insertIntoManagedObjectContext: context)
        
        // Map our properties
        newFight.boxerA = textFieldBoxerA.text
        newFight.boxerB = textFieldBoxerB.text
        newFight.date = NSDate()
        
        if rounds != nil {
            newFight.rounds = rounds!
        } else {
            newFight.rounds = "12"
        }
        
        println("Submitted rounds = \(newFight.rounds)")
        // Set rounds
        
        // Save our context
        context.save(nil)
        
        println(newFight)
        
        // Navigate back to previous controller
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Scroll View
    func scrollViewDidScroll(scrollView: UIScrollView){
        /* Gets called when user scrolls or drags */
        scrollView.alpha = 0.50
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        /* Gets called only after scrolling */
        scrollView.alpha = 1
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool){
            scrollView.alpha = 1
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
    
    func redButton(buttonInQuestion: UIButton) {
        
        var burgundyColor = UIColor(red: 85/255, green: 23/255, blue: 24/255, alpha: 0.8)
        var lightBurgundyColor = UIColor(red: 65/255, green: 23/255, blue: 24/255, alpha: 0.9)
        
        buttonInQuestion.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        buttonInQuestion.titleLabel?.textColor = UIColor .whiteColor()
        buttonInQuestion.backgroundColor = burgundyColor
        
        buttonInQuestion.addTarget(self, action: "activeButton:", forControlEvents: .TouchCancel)
    }

}
