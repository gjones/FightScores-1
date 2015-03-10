//
//  TextFieldViewController.swift
//  FightScores
//
//  Created by Gareth Jones on 2/25/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class TextField: UITextField {

    @IBInspectable var inset: CGFloat = 16
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        self.tintColor = UIColor .whiteColor()
        self.font = UIFont (name: "HelveticaNeue-Light", size: 16)
        return CGRectInset(bounds, inset, 0)
        
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
}
