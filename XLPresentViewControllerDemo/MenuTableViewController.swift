//
//  MenuTableViewController.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/10/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PresentingViewController") as! PresentingViewController
        if indexPath.row != 0 {
            vc.withPresentationViewController = true
        }
        showViewController(vc, sender: nil)
    }
}
