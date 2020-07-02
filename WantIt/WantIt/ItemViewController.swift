//
//  ItemViewController.swift
//  WantIt
//
//  Created by David Yoon on 6/30/20.
//  Copyright © 2020 David Yoon. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var itemInfoTableView: UITableView!
    
    var frame = CGRect.zero
    var items: [Item]!
    var delegate: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePageControl.numberOfPages = items.count
        setupScreens()

        imageScrollView.delegate = self
    }
    
    func setupScreens() {
        for index in 0..<items.count {
            frame.origin.x = imageScrollView.frame.size.width * CGFloat(index)
            frame.size = imageScrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: items[index])

            self.imageScrollView.addSubview(imageView)
        }

        imageScrollView.contentSize = CGSize(width: (imageScrollView.frame.size.width * CGFloat(items.count)), height: imageScrollView.frame.size.height)
        imageScrollView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
