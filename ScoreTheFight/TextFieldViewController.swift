//
//  TextFieldViewController.swift
//  ScoreTheFight
//
//  Created by Gareth Jones on 2/25/15.
//  Copyright (c) 2015 Gareth Jones. All rights reserved.
//

import UIKit

class TextFieldViewController: UITextField {

    @IBInspectable var inset: CGFloat = 16
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, inset)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
}
