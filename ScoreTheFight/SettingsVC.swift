//
//  SettingsViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 3/3/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var labelInformation:    UILabel!
    @IBOutlet weak var labelVersion:        UILabel!
    @IBOutlet weak var labelVersion2:       UILabel!
    @IBOutlet weak var labelFeedback:       UILabel!
    @IBOutlet weak var labelCopyright:      UILabel!
    @IBOutlet weak var viewInformationRow:  UIView!
    @IBOutlet weak var viewFeedbackRow:     UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightNavButton()
        self.title = "Settings"
        labelInformation.text = "About"
        labelVersion.text = "Version"
        labelVersion2.text = "0.0.1"
        labelFeedback.text = "Feedback"
        labelCopyright.text = "Copyright © 2015, Gareth D Jones \nAll rights reserved."
        
        smallLabel(labelInformation)
        softWhiteView(viewInformationRow)
        softWhiteView(viewFeedbackRow)
        offWhiteLabel(labelVersion)
        offWhiteLabel(labelVersion2)
        WhiteLabel(labelFeedback)
        copyrightLabel(labelCopyright)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func rightNavButton() {
        // hide default navigation bar button item
        self.navigationItem.rightBarButtonItem = nil;
        
        let buttonShare: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
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
    
    func smallLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        labelInQuestion.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    }
    
    func softWhiteView(viewInQuestion: UIView) {
        
        var offWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
        
        viewInQuestion.backgroundColor = offWhiteColor
        viewInQuestion.layer.borderColor = borderColor
        viewInQuestion.layer.borderWidth = 0.5
        
    }
    
    func offWhiteLabel(labelInQuestion: UILabel) {
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
    }
    
    func WhiteLabel(labelInQuestion: UILabel) {
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }

    func copyrightLabel(labelInQuestion: UILabel) {
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        labelInQuestion.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
    }
}
