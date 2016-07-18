//
//  ViewController2.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/18.
//  Copyright © 2016年 HMYD. All rights reserved.
//
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "WDFCalenderViewController.h"
#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    WDFCalenderViewController * vc = [[WDFCalenderViewController alloc] init];
    self.view.frame =   CGRectMake(0, 0,kScreenWidth , kScreenHeight);
//    vc.view.frame  = CGRectMake(0, 0, kScreenWidth, 200);
    vc.calenderType = ExerciseCalender;
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
