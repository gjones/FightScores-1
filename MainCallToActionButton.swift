//
//  MainCallToActionButton.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 3/3/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class MainCallToActionButton: UIButton {

    override func drawRect(rect: CGRect) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let lightRed = UIColor(red: 0.608, green: 0.043, blue: 0.043, alpha: 0.700)
        let darkRed = UIColor(red: 0.235, green: 0.106, blue: 0.102, alpha: 0.700)
        
        //// Gradient Declarations
        let redGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [darkRed.CGColor, lightRed.CGColor], [0, 1])
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRectMake(0, 0, self.layer.bounds.width, self.layer.bounds.height), cornerRadius: 3)
        CGContextSaveGState(context)
        rectanglePath.addClip()
        CGContextDrawLinearGradient(context, redGradient, CGPointMake(107, self.layer.bounds.height), CGPointMake(107, -0), 0)
        CGContextRestoreGState(context)
        
        self.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 18)
        UIColor.blackColor().setStroke()
        rectanglePath.lineWidth = 0.5
        rectanglePath.stroke()
    }
    
    

}
