//
//  TableCell.swift
//  FightScores
//
//  Created by Gareth Jones on 3/10/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class StandardTableView: UITableView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.rowHeight              = 82
        self.separatorColor         = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2)
        self.backgroundColor        = UIColor .clearColor()
    }
    
}
