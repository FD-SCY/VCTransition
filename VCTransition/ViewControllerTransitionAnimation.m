//
//  ViewControllerTransitionAnimation.m
//  VCTransition
//
//  Created by 石纯勇 on 2018/3/29.
//  Copyright © 2018年 scy. All rights reserved.
//

#import "ViewControllerTransitionAnimation.h"
#import <UIKit/UIKit.h>

@interface ViewControllerTransitionAnimation ()<UIViewControllerAnimatedTransitioning>
@end

@implementation ViewControllerTransitionAnimation

/*
 这个接口负责切换的具体内容，也即“切换中应该发生什么”。开发者在做自定义切换效果时大部分代码会是用来实现这个接口。
 */
#pragma mark - UIViewControllerAnimatedTransitioning
// 系统给出一个切换上下文，我们根据上下文环境返回这个切换所需要的花费时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 5;
}

// 在进行切换的时候将调用该方法，我们对于切换时的UIView的设置和动画都在这个方法中完成。
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 待转入的vc
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 待转出的vc
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    CGRect startFrame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    toVC.view.frame = startFrame;
    
    
    //
    [transitionContext.containerView addSubview:toVC.view];
    
    /// 这个会根据上一个方法自动计算
    
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
    } completion:^(BOOL finish) {
        [transitionContext completeTransition:YES];
    }];
    
    
    return ;
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0.4 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        toVC.view.frame = finalFrame;
    }
    completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
