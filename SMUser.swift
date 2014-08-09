//
//  User.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class SMUser{
    var Id:String
    var Name:String
    var Jobs:[Job]?
    
    init(id:String, name:String, jobs:[Job]){
        Id = id
        Name = name
        Jobs = jobs
    }
}