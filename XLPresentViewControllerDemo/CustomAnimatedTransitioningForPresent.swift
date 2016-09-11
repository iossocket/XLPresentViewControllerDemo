//
//  CustomOnlyAnimatedTransitioning.swift
//  XLPresentViewControllerDemo
//
//  Created by Xueliang Zhu on 9/11/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

import UIKit

class CustomAnimatedTransitioningForPresent: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let container = transitionContext.containerView()!
        let height = UIScreen.mainScreen().bounds.height
        toView.frame = transitionContext.finalFrameForViewController(toVC)
        toView.center.y += height
        container.addSubview(toView)
        
        let duration = transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, animations: { 
            toView.center = container.center
            }) { _ in
                transitionContext.completeTransition(true)
        }
    }
}
