//
//  Job.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class Job
{
    var Name:String
    var Id:String
    var Loc:Location
    var MonthStartEnd:Int
    var HourlyPaymentBase:Int
    
    init(name:String,id:String,loc:Location,monthStartEnd:Int,hourlyPaymentBase:Int){
        Name = name
        Id = id
        Loc = loc
        MonthStartEnd = monthStartEnd
        HourlyPaymentBase = hourlyPaymentBase
    }
    
}