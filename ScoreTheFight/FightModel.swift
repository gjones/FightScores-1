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
    @NSManaged var boxerA_round3:   String
    @NSManaged var boxerA_round4:   String
    @NSManaged var boxerA_round5:   String
    @NSManaged var boxerA_round6:   String
    @NSManaged var boxerA_round7:   String
    @NSManaged var boxerA_round8:   String
    @NSManaged var boxerA_round9:   String
    @NSManaged var boxerA_round10:   String
    @NSManaged var boxerA_round11:   String
    @NSManaged var boxerA_round12:   String
    @NSManaged var boxerA_totalScore: String
    @NSManaged var boxerB:          String
    @NSManaged var boxerB_round1:   String
    @NSManaged var boxerB_round2:   String
    @NSManaged var boxerB_round3:   String
    @NSManaged var boxerB_round4:   String
    @NSManaged var boxerB_round5:   String
    @NSManaged var boxerB_round6:   String
    @NSManaged var boxerB_round7:   String
    @NSManaged var boxerB_round8:   String
    @NSManaged var boxerB_round9:   String
    @NSManaged var boxerB_round10:   String
    @NSManaged var boxerB_round11:   String
    @NSManaged var boxerB_round12:   String
    @NSManaged var boxerB_totalScore: String
    @NSManaged var rounds:          String
    @NSManaged var notes:           String
    @NSManaged var date:            NSDate
}
