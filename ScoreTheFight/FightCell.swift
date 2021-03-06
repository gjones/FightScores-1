//
//  FightTableViewCell.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class FightCell: UITableViewCell {
    
    var fightDate = FightDate()
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
    
    func updateFightInfo() {
        if fight != nil {
            labelBoxerA.text = fight!.boxerA as String
            labelBoxerB.text = fight!.boxerB as String
            labelBoxerATotal.text = "\(fight!.boxerA_totalScore)"
            labelBoxerBTotal.text = "\(fight!.boxerB_totalScore)"
            labelFightDate.text = fightDate.dateCalculator(fight!.date)
            labelRounds.text = "\(fight!.rounds) Rounds"
        }
    }
}
