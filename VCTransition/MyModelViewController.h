//
//  MyModelViewController.h
//  VCTransition
//
//  Created by 石纯勇 on 2018/3/29.
//  Copyright © 2018年 scy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyModelViewController : UIViewController

@property (nonatomic, copy) void(^dismissBlock)(void);
@end
