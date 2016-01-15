//
//  WZViewController.m
//  WZNavigationDemo
//
//  Created by chenstone on 16/1/15.
//  Copyright © 2016年 chenstone. All rights reserved.
//

#import "WZViewController.h"

@interface WZViewController ()
@property (nonatomic, strong)UIView *maskView;
@property (nonatomic, strong)UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong)UILabel *labelView;
@end

@implementation WZViewController

#pragma mark - getter and setter -
- (UIView *)maskView{
    if(!_maskView){
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [_maskView setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.0]];
        [_maskView setUserInteractionEnabled:YES];
    }
    return _maskView;
}

- (UIActivityIndicatorView *)indicatorView{
    if(!_indicatorView){
        _indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        [_indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
        [_indicatorView hidesWhenStopped];
    }
    return _indicatorView;
}

- (UILabel *)labelView{
    if(!_labelView){
        _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        [_labelView setText:self.titleText];
        [_labelView setTextColor:[UIColor whiteColor]];
    }
    return _labelView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.labelView;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startLoad{
    [self.indicatorView startAnimating];
    [self.view addSubview:self.maskView];
    self.navigationItem.titleView = self.indicatorView;
}

- (void)stopLoad{
    [self.indicatorView stopAnimating];
    [self.maskView removeFromSuperview];
    self.navigationItem.titleView = self.labelView;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

