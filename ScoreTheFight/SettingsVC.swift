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
    @IBOutlet weak var buttonSystem:        UIButton!
    @IBOutlet weak var buttonTwitter:       SoftWhiteButton!
    
    var globalFunctions = globalHeaderFunctions()
    var twitterURL = "https://mobile.twitter.com/fightscoresapp"
    var itunesURL = "itms://itunes.apple.com/us/app/fight-scores/id975691413?ls=1&mt=8"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        labelInfo.text = "General Information"
        labelScores.text = "Scoring Rules"
        labelInformation.text = "About"
        labelVersion.text = "Version"
        labelVersion2.text = getVersion()
        buttonFeedback.setTitle("Rate in the App Store", forState: .Normal)
        buttonTwitter.setTitle("Follow on Twitter", forState: .Normal)
        labelCopyright.text = "Copyright © \(getYear()), Gareth D Jones \nAll rights reserved."
        buttonSystem.setTitle("10 Point System", forState: .Normal)
        globalFunctions.rightButton(self, image: "button_close.png")
    }
    
    func getYear() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitYear, fromDate: date)
        let year = components.year
        return year
    }
    
    func getVersion() -> String {
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        } else {
            return "No Version"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func rightNavButtonClick(sender:UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonSystem(sender: AnyObject) {
        
        let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("rulesVC") as! RulesVC
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            self.navigationController?.pushViewController(switchViewController, animated: false)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: self.navigationController!.view!, cache: false)
        })
        
    }

    @IBAction func buttonFeedback(sender: AnyObject) {
        externalLink(itunesURL)
    }
    
    @IBAction func buttonTwitter(sender: AnyObject) {
        externalLink(twitterURL)
    }
    
    func externalLink(url: String) {
        if let checkURL = NSURL(string: url) {
            if UIApplication.sharedApplication().openURL(checkURL) {
                println("url successfully opened")
            }
        } else {
            println("invalid url")
        }
    }
}
