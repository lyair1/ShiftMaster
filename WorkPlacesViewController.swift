//
//  WorkPlaceViewController.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/2/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import UIKit

class WorkPlacesViewController : UITableViewController, UITableViewDelegate, UITableViewDataSource
{
    let identifire = "WorkPlaceCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var  cell:WorkPlaceCell? = tableView.dequeueReusableCellWithIdentifier(identifire) as? WorkPlaceCell
        
        if (cell == nil)
        {
            let nib:Array = NSBundle.mainBundle().loadNibNamed(identifire, owner: self, options: nil)
            cell = nib[0] as? WorkPlaceCell
        }
        
        cell!.WorkPlaceName.text = "jjj";
        
        return cell;
    }
    
}