//
//  ItemInfoTableViewController.swift
//  WantIt
//
//  Created by David Yoon on 7/5/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit
import CoreData

class ItemInfoTableViewController: UITableViewController {
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var itemInfo: UITextView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var item: NSManagedObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        price.text = "$ " + String(item.value(forKey: "price") as! Double)
        itemInfo.text = item.value(forKey: "itemInfo") as? String
    }
    
}
