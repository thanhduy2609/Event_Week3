//
//  EventCell.swift
//  Event_Week3
//
//  Created by Cntt03 on 4/22/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    
    @IBOutlet weak var lblAddress: UILabel!

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    func configCellWith(event: Event){
        lblAddress.text = event.address
        lblDescription.text = event.description
        lblTitle.text = event.title
    }
}
