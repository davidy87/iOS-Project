//
//  PostViewController2.swift
//  WantIt
//
//  Created by David Yoon on 7/2/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit
import CoreData

protocol CategoryChanger {
    func changeCategory(category: String)
}

class PostViewController2: UIViewController, CategoryChanger {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    
    let segueIdentifier = "CategorySegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func listPressed(_ sender: Any) {
        // Show user an alert for the final decision
        let alert = UIAlertController(
            title: "Are you sure you want to post your item?",
            message: "If you press OK, then your item will be listed.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: {(action) in
                print("here")
                self.storeItem()
                print("after storing")
                self.performSegue(withIdentifier: "HomeSegueIdentifier", sender: nil)
            }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel
        ))
        
        present(alert, animated: true, completion: nil)
    }
    
    // Store an item to the Core Data
    func storeItem() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)

        // Set the attribute values
        entity.setValue(titleField.text, forKey: "title")
        entity.setValue(descriptionField.text, forKey: "itemInfo")
        entity.setValue(Double(priceField.text!), forKey: "price")
 
        // Commit the changes
        do {
            try context.save()
        } catch {
            // If an error occurs...
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    // change the label of the category button
    func changeCategory(category: String) {
        categoryButton.setTitle(category, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
            let nextVC = segue.destination as? CategoryTableViewController {
            nextVC.delegate = self
        }
    }

}
