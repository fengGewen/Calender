//
//  ExerciseCalenderCell.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/16.
//  Copyright © 2016年 HMYD. All rights reserved.
//
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LightGreyColor          RGBA(225,225,225,1)
#define LightGreenColor         RGBA(217,240,194,1)
#define GreenColor          RGBA(107,188,85,1)
#import "ExerciseCalenderCell.h"


@implementation ExerciseCalenderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setExerciseProgress:(CGFloat *)exerciseProgress{
   [self drawCircle];
}
- (CAShapeLayer *)drawCircle{
    
    
    return nil;
}
@end
