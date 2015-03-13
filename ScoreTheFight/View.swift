//
//  View.swift
//  FightScores
//
//  Created by Gareth Jones on 3/12/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class RowView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var offWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
        
        self.backgroundColor = offWhiteColor
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 0.5
    }

}

class BackgroundView: UIImageView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.image = UIImage(named: "Portrait.png")
       // self.backgroundColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0)
    
    }
}