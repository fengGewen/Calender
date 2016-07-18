//
//  BloodPressureCell.h
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/18.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BloodPressureCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *bloodPressurceView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew3;

@end
