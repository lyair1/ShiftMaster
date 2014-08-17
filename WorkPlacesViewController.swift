//
//  WorkPlaceViewController.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/2/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import UIKit

class WorkPlacesViewController : UITableViewController, UITableViewDelegate, UITableViewDataSource, UserProviderDelegate
{
    let identifire = "WorkPlaceCell"
    var provider:UserProvider = UserProvider(user: PFUser.currentUser())
    
    @IBOutlet weak var tableViewOutlet: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        provider.delegate = self
        provider.GetWorkPlaces()
        
//        var SA:[SalaryAditional] = [SalaryAditional(description: "Nesiot", amount: 25, type: SalaryAditional.AdditionalType.Dayly)]
//        var SP:[SalaryPrecent] = [SalaryPrecent(description: "Income Taxes", over: 5000, precent: -20, type: SalaryPrecent.PrecentType.MonthlyOverAmount)]
//        var SH:[SalaryHourly] = [SalaryHourly(description: "Hourly", over: 0, amount: 78)]
//        var calc = Calculator.CreateCalculator(SA, precents: SP, hourlies: SH, name: "Basic Israel", type: Calculator.CalculatorType.Regular)
//        
//        var wp = WorkPalce.CreatePersonalWorkPlace(PFGeoPoint(latitude: 0.1, longitude: 0.1), name: "Microsoft", startEndMonth: 14, baseCalculator: Calculator(value: calc), fourSquareId: "12345")
//        
//        //UserProvider.UpdateCalculator(Calculator(value: calc))
//        //UserProvider.UpdateWorkPlace(WorkPalce(personalWorkPlace: wp))
//        
//        var shift = Shift.CreateShift(NSDate.date(), dateEnd: NSDate.date().dateByAddingTimeInterval(60.0*60.0*3.0), workPlace: WorkPalce(personalWorkPlace: wp), privateCalculator: nil)
//        
//        UserProvider.UpdateShift(Shift(shift: shift))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return countElements(provider.WorkPlaces) + 1
    }
    
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var  cell:WorkPlaceCell? = tableView.dequeueReusableCellWithIdentifier(identifire) as? WorkPlaceCell
        
        if (cell == nil)
        {
            let nib:Array = NSBundle.mainBundle().loadNibNamed(identifire, owner: self, options: nil)
            cell = nib[0] as? WorkPlaceCell
        }
        if indexPath.row != countElements(provider.WorkPlaces){
            cell!.WorkPlaceName?.text = provider.WorkPlaces[indexPath.row].Name
        }else{
            cell!.WorkPlaceName?.text = "Add Work Place"
        }
        
        return cell;
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        if indexPath.row == countElements(provider.WorkPlaces){
            // This is the "Add New Work Place" Row
            
        }
    }
    
    func ProviderUpdated(provider: UserProvider, type: UserProvider.TypeOfUpdate) {
        tableViewOutlet.reloadData()
    }
    
}