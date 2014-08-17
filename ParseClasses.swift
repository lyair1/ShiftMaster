//
//  ParseClasses.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/14/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import Foundation

class ParseBaseVars{
    let createdAt = "createdAt"
    let objectId = "objectId"
    let updatedAt = "updatedAt"
}

class WorkPlaceVars{
    let ClassName = "WorkPlaces"
    let FullName = "FullName"
    let Location = "Location"
    let FourSquareId = "FourSquareId"
}

class ShiftVars{
    let ClassName = "Shifts"
    let Start = "Start"
    let End = "End"
    let Calculator = "Calculator"
    let User = "User"
    let WorkPlace = "PersonalWorkPlace"
}

class CalculatorVars{
    let ClassName = "Calculators"
    let Type = "Type"
    let Additional = "Additional"
    let PrecentAddition = "PrecentAddition"
    let Name = "Name"
    let Creator = "Creator"
    let Hourlies = "Hourlies"
}

class PersonalWorkPlacesVars{
    let ClassName = "PersonalWorkPlaces"
    let Worker = "Worker"
    let WorkPlace = "WorkPlace"
    let StartEndMonth = "StartEndMonth"
    let BaseCalculator = "BaseCalculator"
}