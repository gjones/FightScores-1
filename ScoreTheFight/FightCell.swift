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
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)

    }
    
    func updateFightInfo() {

        if fight != nil {
            
            // Get nicely formatted date
            var rawDate = fight!.date as NSDate
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat  = "dd MMMM, yyyy"
            let timestamp = dateFormatter.stringFromDate(rawDate)
            
            labelBoxerA.text = fight!.boxerA as String
            labelBoxerB.text = fight!.boxerB as String
            labelBoxerATotal.text = "\(fight!.boxerA_totalScore)"
            labelBoxerBTotal.text = "\(fight!.boxerB_totalScore)"
            labelFightDate.text = timestamp
            labelRounds.text = "\(fight!.rounds) Rounds"
        }
    }
}
