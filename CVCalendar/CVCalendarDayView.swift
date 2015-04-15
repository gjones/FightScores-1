//
//  CVCalendarDayView.swift
//  CVCalendar
//
//  Created by E. Mozharovsky on 12/26/14.
//  Copyright (c) 2014 GameApp. All rights reserved.
//

import UIKit

class CVCalendarDayView: UIView {
    // MARK: - Public properties
    let weekdayIndex: Int!
    weak var weekView: CVCalendarWeekView!
    
    var date: CVDate!
    var dayLabel: UILabel!
    
    var circleView: CVAuxiliaryView?
    
    var isOut = false
    var isCurrentDay = false
    
    weak var monthView: CVCalendarMonthView! {
        get {
            return weekView.monthView
        }
    }
    
    weak var calendarView: CVCalendarView! {
        get {
            var calendarView: CVCalendarView!
            if let activeCalendarView = weekView!.monthView!.calendarView {
                calendarView = activeCalendarView
            }
            
            return calendarView
        }
    }
    
    override var frame: CGRect {
        didSet {
            if oldValue != frame {
            }
        }
    }
    
    // MARK: - Initialization
    
    init(weekView: CVCalendarWeekView, frame: CGRect, weekdayIndex: Int) {
        self.weekView = weekView
        self.weekdayIndex = weekdayIndex
        
        super.init(frame: frame)
        
        date = dateWithWeekView(weekView, andWeekIndex: weekdayIndex)
        
        labelSetup()
    }
    
    func dateWithWeekView(weekView: CVCalendarWeekView, andWeekIndex index: Int) -> CVDate {
        func hasDayAtWeekdayIndex(weekdayIndex: Int, weekdaysDictionary: [Int : [Int]]) -> Bool {
            for key in weekdaysDictionary.keys {
                if key == weekdayIndex {
                    return true
                }
            }
            
            return false
        }
        
        
        var day: Int!
        let weekdaysIn = weekView.weekdaysIn
        
        if let weekdaysOut = weekView.weekdaysOut {
            if hasDayAtWeekdayIndex(weekdayIndex, weekdaysOut) {
                isOut = true
                day = weekdaysOut[weekdayIndex]![0]
            } else if hasDayAtWeekdayIndex(weekdayIndex, weekdaysIn!) {
                day = weekdaysIn![weekdayIndex]![0]
            }
        } else {
            day = weekdaysIn![weekdayIndex]![0]
        }
        
        if day == monthView.currentDay && !isOut {
            let manager = CVCalendarManager.sharedManager
            let dateRange = manager.dateRange(monthView.date)
            let currentDateRange = manager.dateRange(NSDate())
            
            if dateRange.month == currentDateRange.month && dateRange.year == currentDateRange.year {
                isCurrentDay = true
            }
            
        }
        
        
        let dateRange = CVCalendarManager.sharedManager.dateRange(monthView.date)
        let year = dateRange.year
        let week = dateRange.weekOfMonth
        var month = dateRange.month
        
        // TODO: Fix math part
        if isOut {
            day > 20 ? month-- : month++
            
            let shouldShowDaysOut = calendarView.shouldShowWeekdaysOut
            if !shouldShowDaysOut {
                hidden = true
            }
        }
        
        return CVDate(day: day, month: month, week: week, year: year)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Subviews setup

extension CVCalendarDayView {
    func labelSetup() {
        let appearance = CVCalendarViewAppearance.sharedCalendarViewAppearance
        
        dayLabel = UILabel()
        dayLabel!.text = String(date.day)
        dayLabel!.textAlignment = NSTextAlignment.Center
        dayLabel!.frame = bounds
        
        var font = appearance.dayLabelWeekdayFont
        var color: UIColor?
        
        if isOut {
            color = appearance.dayLabelWeekdayOutTextColor
        } else if isCurrentDay {
            let coordinator = CVCalendarDayViewControlCoordinator.sharedControlCoordinator
            if coordinator.selectedDayView == nil {
                let touchController = CVCalendarTouchController.sharedTouchController
                touchController.receiveTouchOnDayView(self)
            } else {
                color = appearance.dayLabelPresentWeekdayTextColor
                if appearance.dayLabelPresentWeekdayInitallyBold! {
                    font = appearance.dayLabelPresentWeekdayBoldFont
                } else {
                    font = appearance.dayLabelPresentWeekdayFont
                }
            }
            
        } else {
            color = appearance.dayLabelWeekdayInTextColor
        }
        
        if color != nil && font != nil {
            dayLabel!.textColor = color!
            dayLabel!.font = font
        }
        
        addSubview(dayLabel!)
    }
    
    // TODO: Make this widget customizable
    
}


// MARK: - Circle geometry

extension CGFloat {
    func toRadians() -> CGFloat {
        return CGFloat(self) * CGFloat(M_PI / 180)
    }
    
    func toDegrees() -> CGFloat {
        return CGFloat(180/M_PI) * self
    }
}

extension CVCalendarDayView {
    func pointAtAngle(angle: CGFloat, withinCircleView circleView: UIView) -> CGPoint {
        let radius = circleView.bounds.width / 2
        let xDistance = radius * cos(angle)
        let yDistance = radius * sin(angle)
        
        let center = circleView.center
        var x = floor(cos(angle)) < 0 ? center.x - xDistance : center.x + xDistance
        var y = center.y - yDistance
        
        let result = CGPointMake(x, y)
        
        return result
    }
    
    func moveView(view: UIView, onCircleView circleView: UIView, fromAngle angle: CGFloat, toAngle endAngle: CGFloat, straight: Bool) {
        let condition = angle > endAngle ? angle > endAngle : angle < endAngle
        if straight && angle < endAngle || !straight && angle > endAngle {
            UIView.animateWithDuration(pow(10, -1000), delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                let angle = angle.toRadians()
                view.center = self.pointAtAngle(angle, withinCircleView: circleView)
                }) { _ in
                    let speed = CGFloat(750).toRadians()
                    let newAngle = straight ? angle + speed : angle - speed
                    self.moveView(view, onCircleView: circleView, fromAngle: newAngle, toAngle: endAngle, straight: straight)
            }
        }
    }
}

// MARK: - Day label state management

extension CVCalendarDayView {
    func setDayLabelHighlighted() {
        println("Highlighted")
        let appearance = CVCalendarViewAppearance.sharedCalendarViewAppearance
        
        var backgroundColor: UIColor!
        var backgroundAlpha: CGFloat!
        
        if isCurrentDay {
            dayLabel?.textColor = appearance.dayLabelPresentWeekdayHighlightedTextColor!
            dayLabel?.font = appearance.dayLabelPresentWeekdayHighlightedFont
            backgroundColor = appearance.dayLabelPresentWeekdayHighlightedBackgroundColor
            backgroundAlpha = appearance.dayLabelPresentWeekdayHighlightedBackgroundAlpha
        } else {
            dayLabel?.textColor = appearance.dayLabelWeekdayHighlightedTextColor
            dayLabel?.font = appearance.dayLabelWeekdayHighlightedFont
            backgroundColor = appearance.dayLabelWeekdayHighlightedBackgroundColor
            backgroundAlpha = appearance.dayLabelWeekdayHighlightedBackgroundAlpha
        }
        
        if let circleView = circleView {
            circleView.fillColor = backgroundColor
            circleView.alpha = backgroundAlpha
            circleView.setNeedsDisplay()
        } else {
            circleView = CVAuxiliaryView(frame: dayLabel!.bounds, shape: .Rect)
            circleView!.fillColor = circleView!.defaultFillColor
            circleView!.alpha = backgroundAlpha
            insertSubview(circleView!, atIndex: 0)
        }
        
        
    }
    
    func setDayLabelUnhighlightedDismissingState(removeViews: Bool) {
        println("Deselected")
        
        let appearance = CVCalendarViewAppearance.sharedCalendarViewAppearance
        
        var color: UIColor?
        if isOut {
            color = appearance.dayLabelWeekdayOutTextColor
        } else if isCurrentDay {
            color = appearance.dayLabelPresentWeekdayTextColor
        } else {
            color = appearance.dayLabelWeekdayInTextColor
        }
        
        var font: UIFont?
        if self.isCurrentDay {
            if appearance.dayLabelPresentWeekdayInitallyBold! {
                font = appearance.dayLabelPresentWeekdayBoldFont
            } else {
                font = appearance.dayLabelWeekdayFont
            }
        } else {
            font = appearance.dayLabelWeekdayFont
        }
        
        dayLabel?.textColor = color
        dayLabel?.font = font
        
        
        if removeViews {
            circleView?.removeFromSuperview()
            circleView = nil
        }
    }
    
    func setDayLabelSelected() {
        println("Selected")
        
        let appearance = CVCalendarViewAppearance.sharedCalendarViewAppearance
        
        var backgroundColor: UIColor!
        var backgroundAlpha: CGFloat!
        
        if isCurrentDay {
            dayLabel?.textColor = appearance.dayLabelPresentWeekdaySelectedTextColor!
            dayLabel?.font = appearance.dayLabelPresentWeekdaySelectedFont
            backgroundColor = appearance.dayLabelPresentWeekdaySelectedBackgroundColor
            backgroundAlpha = appearance.dayLabelPresentWeekdaySelectedBackgroundAlpha
        } else {
            dayLabel?.textColor = appearance.dayLabelWeekdaySelectedTextColor
            dayLabel?.font = appearance.dayLabelWeekdaySelectedFont
            backgroundColor = appearance.dayLabelWeekdaySelectedBackgroundColor
            backgroundAlpha = appearance.dayLabelWeekdaySelectedBackgroundAlpha
        }
        
        if let circleView = circleView {
            circleView.fillColor = backgroundColor
            circleView.alpha = backgroundAlpha
            circleView.setNeedsDisplay()
        } else {
            circleView = CVAuxiliaryView(frame: dayLabel!.bounds, shape: .Circle)
            circleView!.fillColor = backgroundColor
            circleView!.alpha = backgroundAlpha
            circleView?.setNeedsDisplay()
            insertSubview(circleView!, atIndex: 0)
        }
        
    }
    
    func setDayLabelDeselectedDismissingState(removeViews: Bool) {
        setDayLabelUnhighlightedDismissingState(removeViews)
    }
    
}

// MARK: - Content reload

extension CVCalendarDayView {
    func reloadContent() {
        dayLabel?.frame = bounds
        
        var shouldShowDaysOut = calendarView.shouldShowWeekdaysOut!
        if !shouldShowDaysOut {
            if isOut {
                hidden = true
            }
        } else {
            if isOut {
                hidden = false
            }
        }
        
        if circleView != nil {
            setDayLabelDeselectedDismissingState(true)
            setDayLabelSelected()
        }
    }
}

// MARK: - Safe execution

extension CVCalendarDayView {
    func safeExecuteBlock(block: Void -> Void, collapsingOnNil collapsing: Bool, withObjects objects: AnyObject?...) {
        for object in objects {
            if object == nil {
                if collapsing {
                    fatalError("Object { \(object) } must not be nil!")
                } else {
                    return
                }
            }
        }
        
        block()
    }
}
