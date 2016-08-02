//
//  ViewController.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/14.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import "ViewController.h"
#import "calss1ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "WDFCalenderViewController.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
//    WDFCalenderViewController * vc = [[WDFCalenderViewController alloc] init];
//    vc.calenderType = TemperatureCalender;
//    [vc addParentController:self];
}
- (IBAction)temperature:(id)sender {
    calss1ViewController * vc = [[calss1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (IBAction)exercise:(id)sender {
    ViewController2 * vc = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)bloodPerssure:(id)sender {
    ViewController3 * vc = [[ViewController3 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)bloodSuager:(id)sender {
    ViewController4 * vc = [[ViewController4 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
