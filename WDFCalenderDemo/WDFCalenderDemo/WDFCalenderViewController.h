//
//  WDFCalenderViewController.h
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/15.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , CalenderType) {
    ExerciseCalender    = 0,
    BloodPressureCalender =1 ,
    BloodSugarCalender = 2 ,
    TemperatureCalender = 3,
};

@interface WDFCalenderViewController : UIViewController
@property (nonatomic,assign)CalenderType calenderType;
- (void)addParentController:(UIViewController *)viewController;
@end
