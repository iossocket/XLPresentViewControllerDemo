//
//  CustomOnlyAnimatedTransitioning.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/11/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

class CustomAnimatedTransitioningForPresent: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let container = transitionContext.containerView
        let height = UIScreen.main.bounds.height
        toView.frame = transitionContext.finalFrame(for: toVC)
        toView.center.y += height
        container.addSubview(toView)
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: { 
            toView.center = container.center
        }, completion: { _ in
            transitionContext.completeTransition(true)
        }) 
    }
}
