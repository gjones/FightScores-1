//
//  AddFightViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class AddFightViewController: UIViewController {

    @IBOutlet weak var textFieldBoxerA: UITextField!
    @IBOutlet weak var textFieldBoxerB: UITextField!
    @IBOutlet weak var textFieldRounds: UITextField!
    
    var boxerA: String?
    var boxerB: String?
    var rounds: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if boxerA != nil {
            title = boxerA
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
        newFight.rounds = textFieldRounds.text
        
        // Save our context
        context.save(nil)
        
        // Navigate back to previous controller
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    

}
