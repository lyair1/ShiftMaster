//
//  User.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/9/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class SMUser{
    var Value:PFUser
    
    var WorkPalces:[String] = [] //Array of PersonalWorkPlaces
    
    init(){
        Value = PFUser.currentUser()
    }
    
    init(user:PFUser){
        Value = user
    }
}