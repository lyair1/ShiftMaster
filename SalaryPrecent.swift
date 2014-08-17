//
//  SalaryPrecent.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/12/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class SalaryPrecent{
    enum PrecentType : String {
        case MonthlyOverHours = "MonthlyOverHours", WeeklyOverHours = "WeeklyOverHours", DaylyOverHours = "DaylyOverHours", MonthlyOverAmount = "MonthlyOverAmount"
        
        static let allValues = [MonthlyOverHours, WeeklyOverHours, DaylyOverHours, MonthlyOverAmount]
    }
    
    var Description:String
    var Over:Int // Can be hours or amount depend on type
    var Precent:Int // example: -10 for -%10 or 150 for 150%
    var Type:PrecentType
    
    init(properties:String){
        let propArray = properties.componentsSeparatedByString("$")
        Description = propArray[0]
        Over = propArray[1].toInt()!
        Precent = propArray[2].toInt()!
        Type = PrecentType.fromRaw(propArray[3])!
    }
    
    init(description:String, over:Int, precent:Int, type:PrecentType){
        Description = description
        Over = over
        Precent = precent
        Type = type
    }
    
    class func StringCreator(array:[SalaryPrecent]) -> [String]{
        var strArray:[String] = []
        
        for item in array{
            var str = ""
            str += item.Description + "$"
            str += String(item.Over) + "$"
            str += String(item.Precent) + "$"
            str += item.Type.toRaw()
            
            strArray.append(str)
        }
        
        return strArray;
    }
}