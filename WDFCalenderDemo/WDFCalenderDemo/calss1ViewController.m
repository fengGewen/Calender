//
//  calss1ViewController.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/18.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import "calss1ViewController.h"
#import "WDFCalenderViewController.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface calss1ViewController ()

@end

@implementation calss1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.view.frame =   CGRectMake(0, 0,kScreenWidth , kScreenHeight);
    WDFCalenderViewController * vc = [[WDFCalenderViewController alloc] init];
    vc.calenderType = TemperatureCalender;
    [vc isFirstResponder];
    [vc addParentController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
