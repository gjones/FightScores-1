//
//  RulesVC.swift
//  FightScores
//
//  Created by Gareth Jones on 3/12/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class RulesVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelRules: standardLabel!
    @IBOutlet weak var labelRulesTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "10 Point System"
        labelRulesTitle.text = "How to Score a Fight"
        labelRules.text = "Modern bouts generally range from 4 to 12 rounds. Each round should be scored separately and you should try not take into account events from other rounds when scoring the current one. The fighter who wins the round should receive the score of 10, with the fighter who loses the round receiving 9. If you deem the round too even to call then both fighters should be awarded 10. Every time a fighter is knocked down you should deduct a point, so if a fighter has been knocked down and has also lost the round (which is generally the case) the round should be scored 10-8. If a fighter is knocked down twice in a round you should score the round 10-7. If both fighters are knocked down in a round then a 9-9 or 9-8 score is possible. \n \nReferees will sometimes also take points from fighters that they feel have broken the rules of the sport, these deductions should be accounted for on your scorecard."
        
        // Scrollview
        scrollView.userInteractionEnabled = true
        scrollView.indicatorStyle = .Black
        view.addSubview(scrollView)
        
        // Custom Nav Items
        leftNavButton()
        
        // Adding swipe back to previous page
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Custom Navigation Controls
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
        let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("settingsVC") as SettingsVC
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            self.navigationController?.pushViewController(switchViewController, animated: false)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: self.navigationController!.view!, cache: false)
        })
        
    }
    
    // Right Swipe Functionality
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                
                let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("settingsVC") as SettingsVC
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
                    self.navigationController?.pushViewController(switchViewController, animated: false)
                    UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: self.navigationController!.view!, cache: false)
                })
                
            default:
                break
            }
        }
    }

}
