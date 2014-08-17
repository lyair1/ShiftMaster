//
//  UserProvider.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

protocol UserProviderDelegate {
    func ProviderUpdated(provider:UserProvider, type:UserProvider.TypeOfUpdate)
}

class UserProvider
{
    enum TypeOfUpdate : String {
        case WorkPlaces = "WorkPlaces", Shifts = "Shifts"
        
        static let allValues = [WorkPlaces, Shifts]
    }
    
    var delegate:UserProviderDelegate?
    var User:SMUser?
    var WorkPlaces:[WorkPalce] = []
    var Shifts:[Shift] = []
    
    init(){
        User = SMUser()
    }
    
    init(user:SMUser){
        User = user
    }
    
    init(user:PFUser){
        User = SMUser(user: user);
    }
    
    // Retreive information
    
    func GetWorkPlaces(){
        var query = PFQuery(className: PersonalWorkPlacesVars().ClassName)
        query.whereKey(PersonalWorkPlacesVars().Worker, equalTo: User?.Value)
        query.includeKey(PersonalWorkPlacesVars().WorkPlace)
        query.includeKey(PersonalWorkPlacesVars().BaseCalculator)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !error {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) WorkPlaces.")
                for object : AnyObject! in objects {
                    self.WorkPlaces.append(WorkPalce(personalWorkPlace: object as PFObject))
                }
                self.delegate?.ProviderUpdated(self, type: TypeOfUpdate.WorkPlaces)
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo)
            }
        }
    }
    
    func GetAllShifts(){
        var query = PFQuery(className: ShiftVars().ClassName)
        query.whereKey(ShiftVars().User, equalTo: User)
        query.includeKey(ShiftVars().Calculator)
        query.includeKey(ShiftVars().WorkPlace)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !error {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) WorkPlaces.")
                for object : AnyObject! in objects {
                    self.Shifts.append(Shift(shift: object as PFObject))
                }
                self.delegate?.ProviderUpdated(self, type: TypeOfUpdate.Shifts)
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo)
            }
        }
    }
    
    func GetShiftsFromDate(date:NSDate){
        var query = PFQuery(className: ShiftVars().ClassName)
        query.whereKey(ShiftVars().User, equalTo: User)
        query.whereKey(ShiftVars().Start, greaterThan: date)
        query.includeKey(ShiftVars().Calculator)
        query.includeKey(ShiftVars().WorkPlace)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !error {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) WorkPlaces.")
                for object : AnyObject! in objects {
                    self.Shifts.append(Shift(shift: object as PFObject))
                }
                self.delegate?.ProviderUpdated(self, type: TypeOfUpdate.Shifts)
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo)
            }
        }
    }

    func GetAllShiftsFromWorkPlace(workPlace:WorkPalce){
        var query = PFQuery(className: ShiftVars().ClassName)
        query.whereKey(ShiftVars().User, equalTo: User)
        query.whereKey(ShiftVars().WorkPlace, equalTo: workPlace.Value)
        query.includeKey(ShiftVars().Calculator)
        query.includeKey(ShiftVars().WorkPlace)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !error {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) WorkPlaces.")
                for object : AnyObject! in objects {
                    self.Shifts.append(Shift(shift: object as PFObject))
                }
                self.delegate?.ProviderUpdated(self, type: TypeOfUpdate.Shifts)
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo)
            }
        }
    }
    
    func GetShiftsFromDateAndWorkPlace(date:NSDate, workPlace:WorkPalce){
        var query = PFQuery(className: ShiftVars().ClassName)
        query.whereKey(ShiftVars().User, equalTo: User)
        query.whereKey(ShiftVars().WorkPlace, equalTo: workPlace.Value)
        query.whereKey(ShiftVars().Start, greaterThan: date)
        query.includeKey(ShiftVars().Calculator)
        query.includeKey(ShiftVars().WorkPlace)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !error {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) WorkPlaces.")
                for object : AnyObject! in objects {
                    self.Shifts.append(Shift(shift: object as PFObject))
                }
                self.delegate?.ProviderUpdated(self, type: TypeOfUpdate.Shifts)
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo)
            }
        }
    }
    
    // Updating objects
    class func UpdateWorkPlace(workPlace:WorkPalce){
        var obj:PFObject
        
        if (workPlace.Value != nil){
            obj = workPlace.Value
        }else{
            obj = PFObject(className: WorkPlaceVars().ClassName)
            workPlace.Value = obj
        }
        
        workPlace.Personal.saveEventually()
    }
    
    class func UpdateShift(shif:Shift){
        var obj:PFObject
        
        if (shif.Value != nil){
            obj = shif.Value
        }else{
            obj = PFObject(className: ShiftVars().ClassName)
            shif.Value = obj
        }
        
        obj.saveEventually()
    }
    
    class func UpdateCalculator(calculator:Calculator){
        var obj:PFObject
        
        if (calculator.Value != nil){
            obj = calculator.Value!
        }else{
            obj = PFObject(className: CalculatorVars().ClassName)
            calculator.Value = obj
        }
        
        obj.saveEventually()
    }
    
    
    
    
}

































