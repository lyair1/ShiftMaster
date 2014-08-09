//
//  SMCommon.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/2/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import UIKit

class SMCommon{
    // Colors
    let SMCOrangeTanZombie = UIColor(red: 232.0/250, green: 208.0/250,blue: 169.0/250, alpha: 1)
    let SMCNomadOrange = UIColor(red: 183.0/250, green: 175.0/250, blue: 163.0/250, alpha: 1)
    let SMCBlueGreenJetStream = UIColor(red: 193.0/250, green: 218.0/250, blue: 214.0/250, alpha: 1)
    let SMCCatskilWhite = UIColor(red: 245.0/250, green: 250.0/250, blue: 250.0/250, alpha: 1)
    let SMCRegantStBlue = UIColor(red: 172.0/250, green: 209.0/250, blue: 233.0/250, alpha: 1)
    let SMCGothicLightBlue = UIColor(red: 109.0/250, green: 146.0/250, blue: 155.0/250, alpha: 1)
    
    // Fonts
    
    // Buttons
    
    class func CreateTextButton(text : NSString, loc_x : Int, loc_y : Int, width : Int, height:Int) -> UIButton{
        var but :UIButton
        but = UIButton(frame: CGRect(x: loc_x, y: loc_y, width: width, height: height))
        but.setTitle(text, forState: UIControlState.Normal)
        but.setTitleColor(SMCommon().SMCNomadOrange, forState: UIControlState.Normal)
    
        return but
    }
}