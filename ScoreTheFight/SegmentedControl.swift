//
//  SegmentedControl.swift
//  FightScores
//
//  Created by Gareth Jones on 4/13/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class StandardSegmentedControl: UISegmentedControl {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        var offWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        self.tintColor = offWhiteColor
    }
}