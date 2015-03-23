//
//  FightTableViewCell.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class FightCell: UITableViewCell {
    
    var fight : Fight? {
        didSet {
            updateFightInfo()
        }
    }

    @IBOutlet weak var labelBoxerA: UILabel!
    @IBOutlet weak var labelBoxerB: UILabel!
    @IBOutlet weak var labelRounds: UILabel!
    @IBOutlet weak var labelFightDate: UILabel!
    @IBOutlet weak var labelBoxerATotal: UILabel!
    @IBOutlet weak var labelBoxerBTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor .clearColor()

    }
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if (highlighted) {
            self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        }
        else {
            self.backgroundColor = UIColor .clearColor()
        }
    }
    
    func dateCalculator(date: NSDate, label: UILabel) {
        
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
            label.text = "Today"
        } else if timestamp == tomorrowTimestamp {
            label.text = "Tomorrow"
        } else if timestamp == yesterdayTimestamp {
            label.text = "Yesterday"
        } else {
            label.text = timestamp
        }
        
    }

    
    func updateFightInfo() {

        if fight != nil {
            dateCalculator(fight!.date, label: labelFightDate)
            
            labelBoxerA.text = fight!.boxerA as String
            labelBoxerB.text = fight!.boxerB as String
            labelBoxerATotal.text = "\(fight!.boxerA_totalScore)"
            labelBoxerBTotal.text = "\(fight!.boxerB_totalScore)"
            
            labelRounds.text = "\(fight!.rounds) Rounds"
        }
    }
}
