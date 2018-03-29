//
//  MyModelViewController.m
//  VCTransition
//
//  Created by 石纯勇 on 2018/3/29.
//  Copyright © 2018年 scy. All rights reserved.
//

#import "MyModelViewController.h"

@interface MyModelViewController ()

@end

@implementation MyModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 100, 100, 30);
    [btn setTitle:@"dimiss" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(140, 100, 100, 30);
    [btn1 setTitle:@"pop" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)pop {
    self.navigationController.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismiss {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        if (self.dismissBlock) {
            self.dismissBlock();
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
