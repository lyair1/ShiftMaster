//
//  Location.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class Location
{
    var Address:String
    var Latitude:Double
    var Longitude:Double
    
    init(address:String,latitude:Double,longitude:Double){
        Address = address
        Latitude = latitude
        Longitude = longitude
    }
}