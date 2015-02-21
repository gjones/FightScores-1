//
//  EditFightViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class EditFightViewController: UIViewController {
    
    @IBOutlet weak var scrollView:      UIScrollView!
    @IBOutlet weak var labelBoxerA:     UILabel!
    @IBOutlet weak var labelBoxerB:     UILabel!
    @IBOutlet weak var labelNotes:      UILabel!
    @IBOutlet weak var labelvs:         UILabel!
    @IBOutlet weak var labelRound1:     UILabel!
    
    @IBOutlet weak var textFieldNotes:  UITextField!
    @IBOutlet weak var textFieldA_Rd1:      UITextField!
    @IBOutlet weak var textFieldB_Rd1:      UITextField!
    
    var boxerA: String?
    var boxerB: String?
    var rounds: String?
    var date:   String?
    var notes:  String?
    
    var thisFight: NSManagedObject!

    override func viewDidLoad() {
        super.viewDidLoad()

        // navigationItem.titleView = UIImageView(image: UIImage(named: "Logo.png"))
        self.title = "Scorecard"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
        labelBoxerA.text =  boxerA
        labelBoxerB.text =  boxerB
        
        if notes != nil {
            textFieldNotes.text = notes
        }
        
        
        // Apply styles
        softWhiteTextField(textFieldNotes)
        softWhiteTextField(textFieldA_Rd1)
        softWhiteTextField(textFieldB_Rd1)
        standardLabel(labelBoxerA)
        standardLabel(labelBoxerB)
        standardLabel(labelNotes)
        standardLabel(labelvs)
        standardLabel(labelRound1)
        
        
        // Scrollview
        scrollView.userInteractionEnabled = true
        scrollView.contentSize = CGSizeMake(0, 700)
        scrollView.indicatorStyle = .Black
        view.addSubview(scrollView)

        println("!!!!!!!!!This Fight \(thisFight)")
        
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
    
    @IBAction func cancelTapped(sender: AnyObject) {
        
        let previousViewController = self.storyboard?.instantiateViewControllerWithIdentifier("FightDetailViewController") as! FightDetailViewController
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func scorecardButton(sender: AnyObject) {
        
        // Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Reference NSManaged object context
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Fight", inManagedObjectContext: context)

        
        thisFight.setValue(textFieldNotes.text as String, forKey: "notes")
        
        //Save our context
        context.save(nil)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func softWhiteTextField(fieldInQuestion: UITextField) {
        
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        fieldInQuestion.layer.cornerRadius = 4
        fieldInQuestion.textColor = UIColor .whiteColor()
        fieldInQuestion.backgroundColor = whiteColor
        fieldInQuestion.layer.borderWidth = 0.5
        fieldInQuestion.layer.borderColor = burgundyColor.CGColor
        fieldInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 14)
    }
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
    }


}
