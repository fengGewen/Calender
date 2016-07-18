//
//  ExerciseCalenderCell.h
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/16.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseCalenderCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property(nonatomic) CGFloat *exerciseProgress;

@end
