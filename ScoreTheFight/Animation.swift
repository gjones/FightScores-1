//
//  Animation.swift
//  FightScores
//
//  Created by Gareth Jones on 4/16/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import Foundation
import UIKit

class Animation: NSObject {
    func makeItGrow(sender: UIButton) {
        var growAnimation:CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        growAnimation.duration = 0.75
        growAnimation.fromValue = NSNumber(float: 1)
        growAnimation.toValue = NSNumber(float: 0.85)
        growAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        growAnimation.autoreverses = true
        growAnimation.repeatCount = FLT_MAX
    
        sender.layer.addAnimation(growAnimation, forKey: nil)
    }

    func makeItPulse(sender: UIButton) {
        var pulseAnimation:CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        pulseAnimation.duration = 0.75
        pulseAnimation.fromValue = NSNumber(float: 0.65)
        pulseAnimation.toValue = NSNumber(float: 0.3)
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = FLT_MAX
    
        sender.layer.addAnimation(pulseAnimation, forKey: nil)
    }

    func stopTheAnimation(sender: UIButton) {
        sender.layer.removeAllAnimations()
    }
}