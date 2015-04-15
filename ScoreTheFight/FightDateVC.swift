//
//  FightDateVC.swift
//  FightScores
//
//  Created by Gareth Jones on 3/21/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class FightDateVC: UIViewController {

    @IBOutlet var menuView: CVCalendarMenuView!
    @IBOutlet var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var buttonRewind: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var labelScroll: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    
    var onDateAvailable : ((date: NSDate) -> ())?
    var fightDate: NSDate!
    
    func sendDate(date: NSDate) {
        self.onDateAvailable?(date: date)
    }
    
    var shouldShowDaysOut = true
    var animationFinished = true
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.calendarView.alpha = 0
        self.menuView.alpha = 0
        labelScroll.alpha = 0
        buttonRewind.alpha = 0
        buttonForward.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.calendarView.commitCalendarViewUpdate()
        self.menuView.commitMenuViewUpdate()
        UIView.animateWithDuration(0.15, animations: {
            self.calendarView.alpha = 1.0
            self.menuView.alpha = 1.0
            self.labelScroll.alpha = 1.0
            self.buttonRewind.alpha = 1.0
            self.buttonForward.alpha = 1.0
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var header_bg = UIImage(named: "header_bg.png")
        viewHeader.backgroundColor =  UIColor(patternImage:header_bg!)
        self.monthLabel.text = CVDate(date: NSDate()).description
        
        if fightDate != nil {
            self.calendarView.toggleMonthViewWithDate(fightDate)
        }
        
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.menuView.commitMenuViewUpdate()
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.calendarView.updateCalendarViewUpdate()
    }
    
    // MARK: - Buttons
    
    @IBAction func confirmDate(sender: AnyObject) {
        if fightDate != nil {
            self.onDateAvailable?(date: fightDate!)
        } else {
            self.onDateAvailable?(date: NSDate())
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonCloseModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func rewindButtonAction(sender: UIButton) {
        self.calendarView.loadPreviousMonthView()
        buttonRewind.enabled = false
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.buttonRewind.enabled = true
        }
    }
    
    @IBAction func forwardButtonAction(sender: UIButton) {
        self.calendarView.loadNextMonthView()
        buttonForward.enabled = false
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.buttonForward.enabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FightDateVC: CVCalendarViewDelegate {
    
    func shouldShowWeekdaysOut() -> Bool {
        return self.shouldShowDaysOut
    }

    func didSelectDayView(dayView: CVCalendarDayView) {
        var year = dayView.date?.year
        var month = dayView.date?.month
        var day = dayView.date?.day
        var dateString = "\(year!)-\(month!)-\(day!)"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        fightDate = dateFormatter.dateFromString(dateString)
        println(dateString)
    }
    
    func presentedDateUpdated(date: CVDate) {
        if self.monthLabel.text != date.description && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .Center
            updatedMonthLabel.text = date.description
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransformMakeTranslation(0, offset)
            updatedMonthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
            
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.monthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransformIdentity
                
                }) { (finished) -> Void in
                    self.animationFinished = true
                    self.monthLabel.frame = updatedMonthLabel.frame
                    self.monthLabel.text = updatedMonthLabel.text
                    self.monthLabel.transform = CGAffineTransformIdentity
                    self.monthLabel.alpha = 1
                    updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
}
