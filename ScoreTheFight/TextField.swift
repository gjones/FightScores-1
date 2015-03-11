//
//  TextFieldViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/25/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class StandardTextField: UITextField {

    @IBInspectable var inset: CGFloat = 16
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        
        self.tintColor = UIColor .whiteColor()
        self.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        self.textColor = UIColor .whiteColor()
        self.backgroundColor = whiteColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor.CGColor
        return CGRectInset(bounds, inset, 0)
        
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
}

class StandardTextView: UITextView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        var burgundyColor = UIColor(red: 155/255, green: 11/255, blue: 11/255, alpha: 0.7)
        var whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        var borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.34)
        
        self.tintColor = UIColor .whiteColor()
        self.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        self.textColor = UIColor .whiteColor()
        self.backgroundColor = whiteColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor.CGColor
        self.textContainerInset = UIEdgeInsetsMake(5, 16, 5, 16)
    }
}
