//
//  ViewController.m
//  VCTransition
//
//  Created by 石纯勇 on 2018/3/29.
//  Copyright © 2018年 scy. All rights reserved.
//

#import "ViewController.h"
#import "MyModelViewController.h"
#import "ViewControllerTransitionAnimation.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)modelVC:(id)sender {
    MyModelViewController *modelVC = [[MyModelViewController alloc]init];
    modelVC.transitioningDelegate = self;
    modelVC.dismissBlock = ^{
        NSLog(@"dimiss回调");
    };
    [self presentViewController:modelVC animated:YES completion:nil];
}

- (IBAction)pushVC:(id)sender {
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:[[MyModelViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return (id)[[ViewControllerTransitionAnimation alloc]init];
}
#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return (id)[[ViewControllerTransitionAnimation alloc]init];
}

//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
//
//}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
//
//}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//
//}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
//
//}



@end
