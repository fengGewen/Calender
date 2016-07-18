//
//  TemperatureCell.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/18.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import "TemperatureCell.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation TemperatureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self drawRoundRectPath];
}

- (CAShapeLayer *)drawRoundRectPath{
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    //指定frame，只是为了设置宽度和高度
    circleLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height );
    //设置居中显示
    circleLayer.position = self.center;
    //设置填充颜色
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    //设置线宽
    circleLayer.lineWidth = 2.0;
    //设置线的颜色
    circleLayer.strokeColor = RGBA(246, 246, 246, 1.0).CGColor;
    
    //使用UIBezierPath创建路径
    CGRect  frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:frame];
    
    //设置CAShaperLayer与UIBezierPath关联
    circleLayer.path = circlePath.CGPath;
    
    //将CAShaperLayer放到某个层显示
    [self.layer addSublayer:circleLayer];
    
    return circleLayer;
}

@end
