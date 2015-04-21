//
//  FightDate.swift
//  FightScores
//
//  Created by Gareth Jones on 3/23/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import Foundation
import UIKit

class FightDate: NSObject {
    func dateCalculator(date: NSDate) -> String {
        
        /// Today
        let rawDateToday = NSDate()
        // Tomorrow
        let rawDateTomorrow = NSCalendar.currentCalendar().dateByAddingUnit(
            .CalendarUnitDay, value: 1, toDate: rawDateToday, options: NSCalendarOptions(0))
        // Yesterday
        let rawDateYesterday = NSCalendar.currentCalendar().dateByAddingUnit(
            .CalendarUnitDay, value: -1, toDate: rawDateToday, options: NSCalendarOptions(0))
        var rawDate = date as NSDate
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "dd MMMM, yyyy"
        
        var timestamp = dateFormatter.stringFromDate(rawDate)
        var todayTimestamp = dateFormatter.stringFromDate(rawDateToday)
        var tomorrowTimestamp = dateFormatter.stringFromDate(rawDateTomorrow!)
        var yesterdayTimestamp = dateFormatter.stringFromDate(rawDateYesterday!)
        
        
        if timestamp == todayTimestamp {
            timestamp = "Today"
        } else if timestamp == tomorrowTimestamp {
            timestamp = "Tomorrow"
        } else if timestamp == yesterdayTimestamp {
            timestamp = "Yesterday"
        } else {
            // Do nothing
        }
        
        return timestamp
        
    }
    
    func shortDateCalculator(date: NSDate) -> String {
        
        /// Today
        let rawDateToday = NSDate()
        // Tomorrow
        let rawDateTomorrow = NSCalendar.currentCalendar().dateByAddingUnit(
            .CalendarUnitDay, value: 1, toDate: rawDateToday, options: NSCalendarOptions(0))
        // Yesterday
        let rawDateYesterday = NSCalendar.currentCalendar().dateByAddingUnit(
            .CalendarUnitDay, value: -1, toDate: rawDateToday, options: NSCalendarOptions(0))
        var rawDate = date as NSDate
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "dd MMM, yyyy"
        
        var timestamp = dateFormatter.stringFromDate(rawDate)
        var todayTimestamp = dateFormatter.stringFromDate(rawDateToday)
        var tomorrowTimestamp = dateFormatter.stringFromDate(rawDateTomorrow!)
        var yesterdayTimestamp = dateFormatter.stringFromDate(rawDateYesterday!)
        
        
        if timestamp == todayTimestamp {
            timestamp = "Today"
        } else if timestamp == tomorrowTimestamp {
            timestamp = "Tomorrow"
        } else if timestamp == yesterdayTimestamp {
            timestamp = "Yesterday"
        } else {
            // Do nothing
        }
        
        return timestamp
        
    }
    
    func establishDateContext(date: NSDate) -> String {
        
        // Input original dates
        var rawDateToday = NSDate()
        var rawDateSupplied = date

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd"

        var todayDate = dateFormatter.stringFromDate(rawDateToday)
        var suppliedDate = dateFormatter.stringFromDate(rawDateSupplied)
        
        var fightContext: String?
        
        if todayDate.compare(suppliedDate) == NSComparisonResult.OrderedDescending {
            fightContext = "Past"
        } else if todayDate == suppliedDate {
            fightContext = "Present"
        } else {
            fightContext = "Future"
        }
        
        // println("\(todayDate) vs \(suppliedDate)" )
        
        return fightContext!
    }
}

class globalHeaderFunctions: UIViewController {
    
    func rightButton(passingView: UIViewController, image: String) -> UIButton {
        passingView.navigationItem.rightBarButtonItem = nil
        passingView.navigationItem.hidesBackButton = true
        
        var button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton        
        var xCoordinate = (passingView.view.frame.size.width - 20)
        button.frame = CGRectMake(0, xCoordinate, 40, 40)
        button.setImage(UIImage(named: image), forState: UIControlState.Normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)
        button.addTarget(passingView, action: "rightNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: button)
        
        passingView.navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: false)
        
        return UIButton()
    }
    
    func leftButton(passingView: UIViewController, image: String) -> UIButton {
        passingView.navigationItem.leftBarButtonItem = nil
        passingView.navigationItem.hidesBackButton = true
        
        let button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        button.frame = CGRectMake(0, 0, 40, 40)
        button.setImage(UIImage(named:image), forState: UIControlState.Normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 20.0)
        button.addTarget(passingView, action: "leftNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: button)
        
        passingView.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
        
        return UIButton()
    }

}