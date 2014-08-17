//
//  Job.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class WorkPalce
{
    var Value:PFObject
    var Personal:PFObject
    var Loc:PFGeoPoint
    var Name:String
    var FourSquareId:String
    var StartEndMonth:Int //WorkPlace property for user
    var BaseCalculator:Calculator //WorkPlace property for user
    
    init(personalWorkPlace:PFObject){
        Personal = personalWorkPlace
        Value = personalWorkPlace[PersonalWorkPlacesVars().WorkPlace] as PFObject
        Name = Value[WorkPlaceVars().FullName] as String
        Loc = Value[WorkPlaceVars().Location] as PFGeoPoint
        StartEndMonth = personalWorkPlace[PersonalWorkPlacesVars().StartEndMonth] as Int
        FourSquareId = Value[WorkPlaceVars().FourSquareId] as String
        BaseCalculator = Calculator(value: personalWorkPlace[PersonalWorkPlacesVars().BaseCalculator] as PFObject)
    }
    
    class func CreateWorkPlace(loc:PFGeoPoint, name:String, fourSquareId:String) -> PFObject{
        var workPlace:PFObject = PFObject(className: WorkPlaceVars().ClassName)
        workPlace[WorkPlaceVars().FullName] = name
        workPlace[WorkPlaceVars().Location] = loc
        workPlace[WorkPlaceVars().FourSquareId] = fourSquareId
        
        return workPlace
    }
    
    class func CreatePersonalWorkPlace(loc:PFGeoPoint, name:String, startEndMonth:Int, baseCalculator:Calculator, fourSquareId:String)->PFObject{
        var pWorkPlace = PFObject(className: PersonalWorkPlacesVars().ClassName)
        
        pWorkPlace[PersonalWorkPlacesVars().BaseCalculator] = baseCalculator.Value
        pWorkPlace[PersonalWorkPlacesVars().StartEndMonth] = startEndMonth
        pWorkPlace[PersonalWorkPlacesVars().Worker] = PFUser.currentUser()
        pWorkPlace[PersonalWorkPlacesVars().WorkPlace] = CreateWorkPlace(loc, name: name, fourSquareId: fourSquareId)
        
        return pWorkPlace;
    }
}