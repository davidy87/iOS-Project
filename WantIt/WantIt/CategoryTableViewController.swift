//
//  CategoryTableViewController.swift
//  WantIt
//
//  Created by David Yoon on 7/2/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var delegate: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            
            let prevVC = delegate as! CategoryChanger
            prevVC.changeCategory(category: cell.textLabel!.text!)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

}
