//
//  PresentedViewController.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/7/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

    var dismiss: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        dismiss?()
    }
    
}
