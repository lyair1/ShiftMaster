//
//  Calculator.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/12/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class Calculator {
    enum CalculatorType : String {
        case Regular = "Regular"
        
        static let allValues = [Regular]
    }
    
    var Value:PFObject? = nil
    var Additionals:[SalaryAditional] = []
    var Precents:[SalaryPrecent] = []
    var Hourlies:[SalaryHourly] = []
    var Name:String = ""
    var Type:CalculatorType = CalculatorType.Regular
    var Creator:PFObject? = nil
    
    init(value:PFObject!){
        if (value != nil){
            Value = value
            for item in value[CalculatorVars().Additional] as [String]{
                Additionals.append(SalaryAditional(properties: item))
            }
            for item in value[CalculatorVars().PrecentAddition] as [String]{
                Precents.append(SalaryPrecent(properties: item))
            }
            for item in value[CalculatorVars().Hourlies] as [String]{
                Hourlies.append(SalaryHourly(properties: item))
            }
            Name = value[CalculatorVars().Name] as String
            Type = CalculatorType.fromRaw(value[CalculatorVars().Type] as String)!
            Creator = value[CalculatorVars().Creator] as? PFObject
        }
    }
    
    class func CreateCalculator(additionals:[SalaryAditional], precents:[SalaryPrecent], hourlies:[SalaryHourly], name:String, type:CalculatorType) -> PFObject{
        var calc = PFObject(className: CalculatorVars().ClassName)
        
        calc[CalculatorVars().Additional] = SalaryAditional.StringCreator(additionals)
        calc[CalculatorVars().Creator] = PFUser.currentUser()
        calc[CalculatorVars().Hourlies] = SalaryHourly.StringCreator(hourlies)
        calc[CalculatorVars().Name] = name
        calc[CalculatorVars().PrecentAddition] = SalaryPrecent.StringCreator(precents)
        calc[CalculatorVars().Type] = type.toRaw()
        
        return calc
    }
}