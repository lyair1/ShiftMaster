//
//  WorkPlaceCell.swift
//  ShiftMaster
//
//  Created by Yair Levi on 8/2/14.
//  Copyright (c) 2014 BarLeviSoft. All rights reserved.
//

import UIKit

class WorkPlaceCell : UITableViewCell
{
    @IBOutlet var WorkPlaceName: UILabel?
    let reusedIdentifire = "WorkPlaceCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
