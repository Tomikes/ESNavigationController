//
//  ESPopAnimation.m
//  ESNavigationController
//
//  Created by mike on 8/24/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "ESPopAnimation.h"
@interface ESPopAnimation()
@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;
@end

@implementation ESPopAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        fromViewController.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (void)animationDidStop:(CATransition *)anim finished:(BOOL)flag {
    [self.transitionContext completeTransition:!_transitionContext.transitionWasCancelled];
}
@end
