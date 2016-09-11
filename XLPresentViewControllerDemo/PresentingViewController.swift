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
    
    @IBAction func present(sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PresentedViewController") as! PresentedViewController
        vc.dismiss = { [weak self] in
            self?.dismiss()
        }
        vc.modalPresentationStyle = .Custom
        vc.transitioningDelegate = self
        
        showViewController(vc, sender: nil)
    }
    
    private func dismiss() {
        dismissViewControllerAnimated(true) { 
            
        }
    }
}

extension PresentingViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return withPresentationViewController ? CustomAnimatedTransitioningForPresent() : CustomAnimatedTransitioning()
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return withPresentationViewController ? CustomPresentaionController(presentedViewController: presented, presentingViewController: presenting) : nil
    }
}

