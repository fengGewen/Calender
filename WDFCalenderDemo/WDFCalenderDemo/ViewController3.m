//
//  ViewController3.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/18.
//  Copyright © 2016年 HMYD. All rights reserved.
//
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "WDFCalenderViewController.h"
#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    WDFCalenderViewController * vc = [[WDFCalenderViewController alloc] init];
    self.view.frame  = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    vc.calenderType = BloodPressureCalender;
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
