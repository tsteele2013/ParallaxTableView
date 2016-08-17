//
//  ViewController.swift
//  Parallax
//
//  Created by Steele, Trevor on 8/16/16.
//  Copyright © 2016 Trevor Steele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.separatorColor = .whiteColor()
        tableView.registerClass(MenuItemTableViewCell.self, forCellReuseIdentifier: "MenuItemCell")
        view.addSubview(tableView)
        
        // layout
        let views = ["tableView": tableView]
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: .AlignAllCenterY, metrics: nil, views: views)
        view.addConstraints(horizontalConstraints)
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|", options: .AlignAllCenterX, metrics: nil, views: views)
        view.addConstraints(verticalConstraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemCell", forIndexPath: indexPath) as! MenuItemTableViewCell
        cell.titleLabel.text = "Item \(indexPath.row)"
        switch indexPath.row {
        case 0,7:
            cell.parallaxView.image = UIImage(named: "notre-dame-logo")
        case 1,8:
            cell.parallaxView.image = UIImage(named: "ohio-university-attack-cat-logo")
        case 2,9:
            cell.parallaxView.image = UIImage(named: "unc-monogram-logo")
        case 3,10:
            cell.parallaxView.image = UIImage(named: "university-of-hawaii-logo")
        case 4,11:
            cell.parallaxView.image = UIImage(named: "university-of-miami-logo")
        case 5,12:
            cell.parallaxView.image = UIImage(named: "university-of-texas-logo")
        case 6,13:
            cell.parallaxView.image = UIImage(named: "wnc-logo")
        default:
            cell.parallaxView.image = UIImage(named: "wnc-logo")
        }
        
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for cell in tableView.visibleCells {
            if let cell = cell as? MenuItemTableViewCell {
                cell.updateParallaxForScrollView(scrollView)
            }
        }
    }
}