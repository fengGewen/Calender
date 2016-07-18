//
//  TemperatureCell.h
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/18.
//  Copyright © 2016年 HMYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *temperatureView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end
