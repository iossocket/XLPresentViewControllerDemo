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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresentingViewController") as! PresentingViewController
        if indexPath.row != 0 {
            vc.withPresentationViewController = true
        }
        show(vc, sender: nil)
    }
}
