//
//  File.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class Shift
{
    var Value:PFObject
    var DateStart:NSDate
    var DateEnd:NSDate
    var WorkPlace:WorkPalce
    var PrivateCalculator:Calculator
    
    init(shift:PFObject){
        Value = shift
        DateStart = shift[ShiftVars().Start] as NSDate
        DateEnd = shift[ShiftVars().End] as NSDate
        WorkPlace = WorkPalce(personalWorkPlace: shift[ShiftVars().WorkPlace] as PFObject)
        PrivateCalculator = Calculator(value: shift[ShiftVars().Calculator] as PFObject!)
    }
    
    class func CreateShift(dateStart:NSDate, dateEnd:NSDate, workPlace:WorkPalce, privateCalculator:Calculator?) -> PFObject{
        var shift = PFObject(className: ShiftVars().ClassName)
        if privateCalculator != nil {
            shift[ShiftVars().Calculator] = privateCalculator
        }else{
            shift[ShiftVars().Calculator] = workPlace.BaseCalculator.Value
        }
        
        shift[ShiftVars().End] = dateEnd
        shift[ShiftVars().Start] = dateStart
        shift[ShiftVars().User] = PFUser.currentUser()
        shift[ShiftVars().WorkPlace] = workPlace.Personal
        
        return shift
    }
}