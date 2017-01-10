//
//  ViewController.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/7/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

class PresentingViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addWidth: NSLayoutConstraint!
    
    var withPresentationViewController: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func present(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresentedViewController") as! PresentedViewController
        vc.dismiss = { [weak self] in
            self?.dismiss()
        }
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        
        show(vc, sender: self)
    }
    
    private func dismiss() {
        self.dismiss(animated: true) { 
            
        }
    }
}

extension PresentingViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return withPresentationViewController ? CustomAnimatedTransitioningForPresent() : CustomAnimatedTransitioning()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return withPresentationViewController ? CustomPresentaionController(presentedViewController: presented, presenting: presenting) : nil
    }
}

