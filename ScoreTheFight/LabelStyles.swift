//
//  LabelStyles.swift
//  FightScores
//
//  Created by Gareth Jones on 3/10/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class standardLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        self.textColor = UIColor .whiteColor()
        self.tintColor = UIColor .whiteColor()
    }
    
}

class smallLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.font = UIFont (name: "HelveticaNeue-Light", size: 12)
        self.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    }
    
}

// Example Usage: FightDetailVC Round Labels
class softWhiteLabel:UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var offWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
    
        self.font = UIFont (name: "HelveticaNeue-Light", size: 14)
        self.textColor = UIColor .whiteColor()
        self.backgroundColor = offWhiteColor
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 0.5
    }
}

// Example Usage: FightDetailVC Boxer Rounds
class borderedLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
        
        self.font = UIFont (name: "HelveticaNeue-Light", size: 14)
        self.textColor = UIColor .whiteColor()
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 0.5
    }
}