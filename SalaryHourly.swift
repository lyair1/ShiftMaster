//
//  SalaryHourly.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/12/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class SalaryHourly{
    var Description:String
    var Over:Int
    var Amount:Int
    
    init(properties:String){
        let propArray = properties.componentsSeparatedByString("$")
        Description = propArray[0]
        Over = propArray[1].toInt()!
        Amount = propArray[2].toInt()!
    }
    
    init(description:String, over:Int, amount:Int){
        Description = description
        Over = over
        Amount = amount
    }
    
    class func StringCreator(array:[SalaryHourly]) -> [String]{
        var strArray:[String] = []
        
        for item in array{
            var str = ""
            
            str += item.Description + "$"
            str += String(item.Over) + "$"
            str += String(item.Amount)
            
            strArray.append(str)
        }
        
        return strArray;
    }
}