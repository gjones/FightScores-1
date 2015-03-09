//
//  FightModel.swift
//  FightScores
//
//  Created by Gareth Jones on 3/5/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import Foundation
import CoreData

@objc(FightModel)

class FightModel: NSManagedObject {

    @NSManaged var boxerA: String
    @NSManaged var boxerA_round1: NSNumber
    @NSManaged var boxerA_round2: NSNumber
    @NSManaged var boxerA_round3: NSNumber
    @NSManaged var boxerA_round4: NSNumber
    @NSManaged var boxerA_round5: NSNumber
    @NSManaged var boxerA_round6: NSNumber
    @NSManaged var boxerA_round7: NSNumber
    @NSManaged var boxerA_round8: NSNumber
    @NSManaged var boxerA_round9: NSNumber
    @NSManaged var boxerA_round10: NSNumber
    @NSManaged var boxerA_round11: NSNumber
    @NSManaged var boxerA_round12: NSNumber
    @NSManaged var boxerA_totalScore: NSNumber
    @NSManaged var boxerB: String
    @NSManaged var boxerB_round1: NSNumber
    @NSManaged var boxerB_round2: NSNumber
    @NSManaged var boxerB_round3: NSNumber
    @NSManaged var boxerB_round4: NSNumber
    @NSManaged var boxerB_round5: NSNumber
    @NSManaged var boxerB_round6: NSNumber
    @NSManaged var boxerB_round7: NSNumber
    @NSManaged var boxerB_round8: NSNumber
    @NSManaged var boxerB_round9: NSNumber
    @NSManaged var boxerB_round10: NSNumber
    @NSManaged var boxerB_round11: NSNumber
    @NSManaged var boxerB_round12: NSNumber
    @NSManaged var boxerB_totalScore: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var notes: String
    @NSManaged var rounds: NSNumber

}
