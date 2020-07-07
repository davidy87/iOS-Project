//
//  ItemViewController.swift
//  WantIt
//
//  Created by David Yoon on 6/30/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var tableView: UIView!
    
    var frame = CGRect.zero
    var item: NSManagedObject!
    var delegate: UIViewController!
    let segueIdentifier = "ItemInfoSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
//        imagePageControl.numberOfPages = items.count
//        setupScreens()

        imageScrollView.delegate = self
    }

//    func setupScreens() {
//        for index in 0..<items.count {
//            frame.origin.x = imageScrollView.frame.size.width * CGFloat(index)
//            frame.size = imageScrollView.frame.size
//
//            let imageView = UIImageView(frame: frame)
//            imageView.image = UIImage(named: items[index])
//
//            self.imageScrollView.addSubview(imageView)
//        }
//
//        imageScrollView.contentSize = CGSize(width: (imageScrollView.frame.size.width * CGFloat(items.count)), height: imageScrollView.frame.size.height)
//        imageScrollView.delegate = self
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
            let nextVC = segue.destination as? ItemInfoTableViewController {
            nextVC.item = item
        }
    }

}
