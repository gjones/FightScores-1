//
//  FightFiltersVC.swift
//  FightScores
//
//  Created by Gareth Jones on 4/13/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

protocol FilterViewControllerDelegate: class {
    func filterViewController(filter: FightFiltersVC,
        didSelectPredicate predicate:NSPredicate?,
        sortDescriptor:NSSortDescriptor?)
}

class FightFiltersVC: UIViewController {
    
    weak var delegate: FilterViewControllerDelegate?
    var selectedSortDescriptor: NSSortDescriptor?
    var selectedPredicate: NSPredicate?
    var stack: CoreDataStack!

    var globalFunctions = globalHeaderFunctions()
    
    @IBOutlet var labelFilter: smallLabel!
    @IBOutlet var buttonShowAll: SoftWhiteButton!
    @IBOutlet var buttonShowToday: SoftWhiteButton!
    @IBOutlet var buttonShowFuture: SoftWhiteButton!
    @IBOutlet var buttonShowPast: SoftWhiteButton!

    @IBOutlet var labelFutureFightCount: smallLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Filter Fights"
        labelFilter.text = "Filtering Options"
        buttonShowAll.setTitle("All Fights", forState: .Normal)
        buttonShowToday.setTitle("Today's Fights", forState: .Normal)
        buttonShowFuture.setTitle("Future Fights", forState: .Normal)
        buttonShowPast.setTitle("Past Fights", forState: .Normal)
        
        populateFutureFightCountLabel()

        // globalFunctions.leftButton(self, image: "button_confirm.png")
        globalFunctions.rightButton(self, image: "button_close.png")
        
    }
    
    lazy var futureFightsPredicate: NSPredicate = {
        var predicate =
        NSPredicate(format: "fight.context == %@", "Future")
        return predicate
        }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rightNavButtonClick(sender:UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func populateFutureFightCountLabel()
    {
        // Future fetch request
        let fetchRequest = NSFetchRequest(entityName: "Fight")
        fetchRequest.resultType = .CountResultType
        fetchRequest.predicate = futureFightsPredicate
        
        var error: NSError?
        
//        let result = stack.context.countForFetchRequest(fetchRequest,
//            error: &error) as NSNumber?
//        


//        println("Result \(fights)")
//        if let countArray = result {
//            
//            let count = countArray[0].integerValue
//            
//            labelFutureFightCount.text = "\(count) fights"
//            
//        } else {
//            println("Could not fetch \(error), \(error!.userInfo)")
//        }
    }

  
}
