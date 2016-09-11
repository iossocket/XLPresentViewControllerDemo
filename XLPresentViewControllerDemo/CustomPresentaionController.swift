//
//  CustomPresentViewController.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/7/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

class CustomPresentaionController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    lazy var dimmingView: UIView = {
        let view = UIView(frame: self.containerView!.bounds)
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.0
        return view
    }()
    
    override func presentationTransitionWillBegin() {
        containerView!.addSubview(presentedView()!)
        containerView!.addSubview(dimmingView)
        
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha = 0.2
                }, completion:nil)
        }
    }
    
    override func presentationTransitionDidEnd(completed: Bool)  {
        if !completed {
            self.dimmingView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin()  {
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha  = 0.0
                }, completion:nil)
        }
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.dimmingView.removeFromSuperview()
        }
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        let screenBound = UIScreen.mainScreen().bounds
        let og = CGPoint(x: screenBound.width / 4, y: screenBound.height / 4)
        return CGRect(origin: og, size: CGSize(width: screenBound.width / 2, height: screenBound.height / 2))
    }
}
