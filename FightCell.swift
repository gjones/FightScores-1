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
        standardLabel(labelBoxerA)
        standardLabel(labelBoxerB)
        standardLabel(labelBoxerATotal)
        standardLabel(labelBoxerBTotal)
        smallLabel(labelFightDate)
        smallLabel(labelRounds)
        
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
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
    }
    
    func smallLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        labelInQuestion.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    }

}
