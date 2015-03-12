//
//  SettingsViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 3/3/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var labelInformation:    smallLabel!
    @IBOutlet weak var labelVersion:        UILabel!
    @IBOutlet weak var labelVersion2:       UILabel!
    @IBOutlet weak var labelCopyright:      smallLabel!
    @IBOutlet weak var viewInformationRow:  UIView!
    @IBOutlet weak var buttonFeedback:      UIButton!
    @IBOutlet weak var labelScores:         offWhiteLabel!
    @IBOutlet weak var labelInfo:           smallLabel!
    @IBOutlet weak var buttonSystem: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightNavButton()
        self.title = "Settings"
        labelInfo.text = "General Information"
        labelScores.text = "Scoring Rules"
        labelInformation.text = "About"
        labelVersion.text = "Version"
        labelVersion2.text = "0.5.4"
        buttonFeedback.setTitle("Rate in the App Store", forState: .Normal)
        labelCopyright.text = "Copyright © 2015, Gareth D Jones \nAll rights reserved."
        buttonSystem.setTitle("10 Point System", forState: .Normal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func rightNavButton() {
        // hide default navigation bar button item
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
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
    
    @IBAction func buttonSystem(sender: AnyObject) {
        
        let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("rulesVC") as RulesVC
        
        UIView.animateWithDuration(0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            self.navigationController?.pushViewController(switchViewController, animated: false)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: self.navigationController!.view!, cache: false)
        })
        
    }

    @IBAction func buttonFeedback(sender: AnyObject) {
        leaveReview()
    }
    
    // Leave a review
    func leaveReview() {
        if let checkURL = NSURL(string: "itms://itunes.apple.com/us/app/apple-store/id375380948?mt=8") {
            if UIApplication.sharedApplication().openURL(checkURL) {
                println("url successfully opened")
            }
        } else {
            println("invalid url")
        }
    }

}
