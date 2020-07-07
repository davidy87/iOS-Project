//
//  ViewController.swift
//  WantIt
//
//  Created by David Yoon on 6/29/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit
import CoreData

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemTableView: UITableView!
    
    let itemCellIdentifier = "ItemCell"
    let segueIdentifier = "ItemSegueIdentifier"
    var itemList: [NSManagedObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemList = retrieveItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemList = retrieveItems()
        itemTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: itemCellIdentifier,
            for: indexPath as IndexPath
        ) as! ItemTableViewCell
        
        let item = itemList[indexPath.row]
        
        cell.title.text = item.value(forKey: "title") as? String
        cell.price.text = "$ " + String(item.value(forKey: "price") as! Double)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func retrieveItems() -> [NSManagedObject] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        var fetchedResults: [NSManagedObject]? = nil
        
        do {
            try fetchedResults = context.fetch(request) as? [NSManagedObject]
        } catch {
            // If an error occurs...
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }

        return (fetchedResults)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
            let nextVC = segue.destination as? ItemViewController,
            let itemIndex = itemTableView.indexPathForSelectedRow?.row {
            
            nextVC.delegate = self
            nextVC.item = itemList[itemIndex]
        }
    }


}

