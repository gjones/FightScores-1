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
        labelRules.text = "A boxing match typically consists of a determined number of three-minute rounds, a total of up to 12 rounds (formerly 15). A minute is typically spent between each round with the fighters in their assigned corners receiving advice and attention from their coach and staff. The fight is controlled by a referee who works within the ring to judge and control the conduct of the fighters, rule on their ability to fight safely, count knocked-down fighters, and rule on fouls. Up to three judges are typically present at ringside to score the bout and assign points to the boxers, based on punches that connect, knockdowns, and other, more subjective measures. \n \nA boxing match can have a number of outcomes. A fight can end before the determined number of rounds if there is a KO (Knockout), TKO (Technical Knockout), TD (Technical Decision - usually the result of cuts caused by headbutts or injuries after 4 rounds), DQ (Disqualification), NC (No Contest - usually the result of cuts caused by headbutts or injuries before 4 rounds are completed)."
        
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
        
        UIView.animateWithDuration(0.75, animations: { () -> Void in
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
                println("User swiped Right")
                
                let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("settingsVC") as SettingsVC
                
                UIView.animateWithDuration(0.75, animations: { () -> Void in
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
