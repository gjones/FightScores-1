//
//  FightDate.swift
//  FightScores
//
//  Created by Gareth Jones on 3/23/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import Foundation

class FightDate: NSObject {
    func dateCalculator(date: NSDate, labelname: String) {
        
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
            var labelname = "Today"
        } else if timestamp == tomorrowTimestamp {
            var labelname = "Tomorrow"
        } else if timestamp == yesterdayTimestamp {
            var labelname = "Yesterday"
        } else {
            var labelname = timestamp
        }
        
    }
    
}