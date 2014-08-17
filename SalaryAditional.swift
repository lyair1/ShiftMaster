//
//  SalaryAditional.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/12/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class SalaryAditional{
    enum AdditionalType : String {
        case Monthly = "Monthly", Weekly = "Weekly", Dayly = "Dayly"
        
        static let allValues = [Monthly, Weekly, Dayly]
    }
    
    var Description:String
    var Amount:Int
    var Type:AdditionalType
    
    init(properties:String){
        let propArray = properties.componentsSeparatedByString("$")
        Description = propArray[0]
        Amount = propArray[1].toInt()!
        Type = AdditionalType.fromRaw(propArray[2])!
    }
    
    init(description:String, amount:Int, type:AdditionalType){
        Description = description
        Amount = amount
        Type = type
    }
    
    class func StringCreator(array:[SalaryAditional]) -> [String]{
        var strArr:[String] = []
        
        for item in array{
            var str:String = ""
            str += item.Description + "$"
            str += String(item.Amount) + "$"
            str += item.Type.toRaw()
            
            strArr.append(str)
        }
        
        return strArr;
    }
}