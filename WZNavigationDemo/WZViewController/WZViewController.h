//
//  WZViewController.h
//  WZNavigationDemo
//
//  Created by chenstone on 16/1/15.
//  Copyright © 2016年 chenstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZViewController : UIViewController
@property (nonatomic, strong)NSString *titleText;
- (void)startLoad;
- (void)stopLoad;
@end
