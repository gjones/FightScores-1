//
//  FightDateVC.swift
//  FightScores
//
//  Created by Gareth Jones on 3/21/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

class FightDateVC: UIViewController, CVCalendarViewDelegate {

    @IBOutlet var menuView: CVCalendarMenuView!
    @IBOutlet var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var buttonRewind: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var labelScroll: UILabel!
    
    @IBAction func buttonCloseModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var viewHeader: UIView!
    
    var onDateAvailable : ((date: NSDate) -> ())?
    var fightDate: NSDate!
    
    func sendDate(date: NSDate) {
        self.onDateAvailable?(date: date)
    }
    
    var shouldShowDaysOut = true
    var animationFinished = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var header_bg = UIImage(named: "header_bg.png")
        viewHeader.backgroundColor =  UIColor(patternImage:header_bg!)
        self.monthLabel.text = CVDate(date: NSDate()).description()
        
        if fightDate != nil {
            self.calendarView.toggleMonthViewWithDate(fightDate)
        }
        
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
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.menuView.commitMenuViewUpdate()
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.calendarView.updateCalendarViewUpdate()
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        if sender.on {
            self.calendarView!.changeDaysOutShowingState(false)
            self.shouldShowDaysOut = true
        } else {
            self.calendarView!.changeDaysOutShowingState(true)
            self.shouldShowDaysOut = false
        }
    }
    
    @IBAction func todayMonthView() {
        self.calendarView.toggleTodayMonthView()
    }
    
    // MARK: Calendar View Delegate
    
    func shouldShowWeekdaysOut() -> Bool {
        return self.shouldShowDaysOut
    }
    
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
    
    func didSelectDayView(dayView: CVCalendarDayView) {
        
        var year = dayView.date?.year
        var month = dayView.date?.month
        var day = dayView.date?.day
        var dateString = "\(year!)-\(month!)-\(day!)"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        fightDate = dateFormatter.dateFromString(dateString)
        
    }
    
    @IBAction func confirmDate(sender: AnyObject) {
        
        if fightDate != nil {
            self.onDateAvailable?(date: fightDate!)
        } else {
            self.onDateAvailable?(date: NSDate())
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> UIColor {
        if dayView.date?.day == 3 {
            return .redColor()
        } else if dayView.date?.day == 5 {
            return .blackColor()
        } else if dayView.date?.day == 2 {
            return .blueColor()
        }
        return .greenColor()
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        return false
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        return false
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func presentedDateUpdated(date: CVDate) {
        if self.monthLabel.text != date.description() && self.animationFinished {
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
    
    @IBAction func rewindButtonAction(sender: UIButton) {
        self.calendarView.loadPreviousMonthView()
    }
    
    @IBAction func forwardButtonAction(sender: UIButton) {
        self.calendarView.loadNextMonthView()
    }
    
    func toggleMonthViewWithMonthOffset(offset: Int) {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = CVCalendarManager.sharedManager
        let components = calendarManager.componentsForDate(NSDate()) // from today
        
        components.month += offset
        
        let resultDate = calendar.dateFromComponents(components)!
        
        self.calendarView.toggleMonthViewWithDate(resultDate)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
