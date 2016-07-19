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

#define  kLineWidth  1.5

#import "ExerciseCalenderCell.h"



@interface ExerciseCalenderCell()

@property (nonatomic) UIImageView * imageView;
@property (nonatomic) CAShapeLayer * outLayer;
@property (nonatomic) CAShapeLayer * progressLayer;

@end


@implementation ExerciseCalenderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.progressColor = GreenColor;
    [self drawRoundRectPath];
    self.exerciseProgress = 60;
    
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
- (void)setExerciseProgress:(CGFloat)exerciseProgress{
    
    //加底部灰色圆环
    self.outLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(8, self.frame.size.height/2 - (self.frame.size.width - 16)/2, self.frame.size.width - 16, self.frame.size.width - 16)];
    self.outLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    self.outLayer.lineWidth = kLineWidth;
    self.outLayer.fillColor = [UIColor clearColor].CGColor;
    self.outLayer.lineCap = kCALineCapRound;
    self.outLayer.path = path.CGPath;
    [self.layer addSublayer:self.outLayer];
    
    // 加蓝色进度圆环
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = _progressColor.CGColor;
    self.progressLayer.lineWidth = kLineWidth;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.path = path.CGPath;
    self.progressLayer.strokeEnd = exerciseProgress / 100.0;
    [self.layer addSublayer:self.progressLayer];
    
}

@end































