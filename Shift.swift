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
    var DateStart:NSDate
    var DateEnd:NSDate
    var JobId:String
    var UniqueHourly:Int
    
    init(dateStart:NSDate, dateEnd:NSDate, jobId:String, uniqueHourly:Int){
        DateStart = dateStart
        DateEnd = dateEnd
        JobId = jobId
        UniqueHourly = uniqueHourly
    }
}