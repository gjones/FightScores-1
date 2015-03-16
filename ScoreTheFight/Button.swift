//
//  MainCallToActionButton.swift
//  FightScores
//
//  Created by Gareth Jones on 3/3/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class RedButton: UIButton {

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

class SoftWhiteButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var offWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34).CGColor
    
        self.backgroundColor = offWhiteColor
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 0.5
        self.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 16)
    }
}

// Scorecard Buttons

class TableRowSoftWhiteButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.24)
        
        self.backgroundColor = whiteColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor.CGColor
        self.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 16)
    }
}

class TableRowOffSoftWhiteButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.05)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.24)
        
        self.backgroundColor = whiteColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor.CGColor
        self.titleLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 16)
    
    }
}

class ScoringRoundButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
            var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)

            self.layer.cornerRadius = 30
            self.clipsToBounds = true
            self.backgroundColor = whiteColor
            self.layer.borderWidth = 1
            self.layer.borderColor = borderColor.CGColor
            self.tintColor = UIColor .whiteColor()
            self.titleLabel!.font = UIFont (name: "HelveticaNeue-Light", size: 26)
    }
}

