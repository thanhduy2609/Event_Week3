//
//  DetailEventViewController.swift
//  Event_Week3
//
//  Created by Cntt03 on 4/22/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController {

    
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!

    var event: Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDes.text = event?.description
        lblTitle.text = event?.title
        lblAddress.text = event?.address
    }
}
