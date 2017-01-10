//
//  CustomAnimatedTransitioning.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/10/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

extension UIColor {
    class func newBlueColor() -> UIColor {
        return UIColor(red: 59.0 / 255, green: 89.0 / 255, blue: 162.0 / 255, alpha: 1)
    }
}

class CustomAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let screenBounds = UIScreen.main.bounds
        toView.frame = transitionContext.finalFrame(for: toVC)
        toView.alpha = 0
        
        let topView = UIView()
        let bottomView = UIView()
        let leftView = UIView()
        let rightView = UIView()
        
        topView.frame = CGRect(x: 0, y: screenBounds.height - 80, width: screenBounds.width, height: 0)
        topView.backgroundColor = UIColor.newBlueColor()
        
        bottomView.frame = CGRect(x: 0, y: screenBounds.height - 20, width: screenBounds.width, height: 0)
        bottomView.backgroundColor = UIColor.newBlueColor()
        
        leftView.frame = CGRect(x: screenBounds.width / 2 - 30, y: screenBounds.height - 80, width: 0, height: 60)
        leftView.backgroundColor = UIColor.newBlueColor()
        
        rightView.frame = CGRect(x: screenBounds.width / 2 + 30, y: screenBounds.height - 80, width: 0, height: 60)
        rightView.backgroundColor = UIColor.newBlueColor()
        
        let container = transitionContext.containerView
        container.addSubview(toView)
        container.addSubview(topView)
        container.addSubview(bottomView)
        container.addSubview(leftView)
        container.addSubview(rightView)
        
        UIView.animate(withDuration: 0.25, animations: {
            leftView.frame = CGRect(x: 0, y: screenBounds.height - 80, width: screenBounds.width / 2 - 30, height: 60)
            rightView.frame = CGRect(x: screenBounds.width / 2 + 30, y: screenBounds.height - 80, width: screenBounds.width / 2 - 30, height: 60)
        }, completion: { _ in
            UIView.animate(withDuration: 0.25, animations: {
                topView.frame = CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height - 80)
                bottomView.frame = CGRect(x: 0, y: screenBounds.height - 20, width: screenBounds.width, height: 20)
                }, completion: { _ in
                    toView.alpha = 1
                    topView.removeFromSuperview()
                    bottomView.removeFromSuperview()
                    leftView.removeFromSuperview()
                    rightView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            })
        }) 
    }
}
