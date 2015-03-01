//
//  FightTableViewCell.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class FightTableViewCell: UITableViewCell {

    @IBOutlet weak var labelBoxerA: UILabel!
    @IBOutlet weak var labelBoxerB: UILabel!
    @IBOutlet weak var labelRounds: UILabel!
    @IBOutlet weak var labelFightDate: UILabel!
    @IBOutlet weak var labelBoxerATotal: UILabel!
    @IBOutlet weak var labelBoxerBTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        standardLabel(labelBoxerA)
        standardLabel(labelBoxerB)
        standardLabel(labelBoxerATotal)
        standardLabel(labelBoxerBTotal)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
    }
    
    func standardLabel(labelInQuestion: UILabel) {
        
        labelInQuestion.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        labelInQuestion.textColor = UIColor .whiteColor()
    }

}
