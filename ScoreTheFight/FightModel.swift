//
//  FightModel.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

@objc(FightModel)

class FightModel: NSManagedObject {
    
    @NSManaged var boxerA:          String
    @NSManaged var boxerA_round1:   String
    @NSManaged var boxerA_round2:   String
    @NSManaged var boxerB:          String
    @NSManaged var boxerB_round1:   String
    @NSManaged var boxerB_round2:   String
    @NSManaged var rounds:          String
    @NSManaged var notes:           String
    @NSManaged var date:            NSDate
}
