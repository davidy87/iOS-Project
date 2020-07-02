//
//  ViewController.swift
//  WantIt
//
//  Created by David Yoon on 6/29/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
}

class HomeViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    
    let segueIdentifier = "ItemSegueIdentifier"
    var items: [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: segueIdentifier,
            for: indexPath as IndexPath
        ) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        
        cell.title.text = item.title
        cell.price.text = String(item.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
            let nextVC = segue.destination as? ItemViewController {
            nextVC.delegate = self
        }
    }


}

