//
//  ESNavigationInteractiveTransition.h
//  ESNavigationController
//
//  Created by mike on 8/24/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UIViewController, UIPercentDrivenInteractiveTransition;
@interface ESNavigationInteractiveTransition : NSObject<UINavigationControllerDelegate>
- (instancetype)initWithViewController:(UIViewController *)vc;
- (void)handleControllerPop:(UIPanGestureRecognizer *)recognizer;
- (UIPercentDrivenInteractiveTransition *)interactivePopTransition;
@end
