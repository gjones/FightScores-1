//
//  AppDelegate.swift
//  FightScores
//
//  Created by Gareth Jones on 2/17/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        configureAppearance()
        
        return true
    }
    
    func configureAppearance() {
        UITableViewCell.appearance().backgroundColor    = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        UITableView.appearance().rowHeight              = 82
        UITableView.appearance().separatorColor         = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2)
        UITableView.appearance().backgroundColor        = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)

    }

}

