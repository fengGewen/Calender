//
//  WDFCalenderViewController.m
//  WDFCalenderDemo
//
//  Created by wendf on 16/7/15.
//  Copyright © 2016年 HMYD. All rights reserved.
//
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#import "WDFCalenderViewController.h"
#import "TemperatureCell.h"
#import "ExerciseCalenderCell.h"
#import "BloodPressureCell.h"
#import "HYCalendarTool.h"

@interface WDFCalenderViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_calendarView;
    NSInteger _daysInLastMonth;// 上个月的天数
    NSInteger _daysInThisMonth;// 本月的天数
    NSInteger _firstWeekday;//第一周上个月有几天
    NSDate *_date;
}
@property (nonatomic) UILabel *dateTitle;
@property (nonatomic) NSMutableArray *dataArray;
@end

@implementation WDFCalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _headerViewWidth.constant = kScreenWidth;
    self.view.frame = CGRectMake(0, 50, kScreenWidth,([UIScreen mainScreen].bounds.size.width/7 + 5) * 6 + 80);
    self.view.backgroundColor = [UIColor whiteColor];
    _date = [NSDate date];
}
- (void)createCalendarView{
    //布局
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    //设置item的宽高
    layout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width/7, [UIScreen mainScreen].bounds.size.width/7 + 5);
    //设置滑动方向
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    //设置行间距
    layout.minimumLineSpacing=0.0f;
    //每列的最小间距
    layout.minimumInteritemSpacing = 0.0f;
    //四周边距
    layout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    _calendarView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth,([UIScreen mainScreen].bounds.size.width/7 + 5) * 6) collectionViewLayout:layout];
    _calendarView.backgroundColor=[UIColor whiteColor];
    _calendarView.delegate=self;
    _calendarView.dataSource=self;
    _calendarView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_calendarView];
//    ExerciseCalender    = 0,
//    BloodPressureCalender =1 ,
//    BloodSugarCalender = 2 ,
//    TemperatureCalender = 3,
    switch (_calenderType) {
        case ExerciseCalender:{
            [_calendarView registerNib:[UINib nibWithNibName:@"ExerciseCalenderCell" bundle:nil] forCellWithReuseIdentifier:@"ExerciseCalenderId"];
        }
            break;
        case TemperatureCalender:{
            [_calendarView registerNib:[UINib nibWithNibName:@"TemperatureCell" bundle:nil] forCellWithReuseIdentifier:@"TemperatureCellId"];
        }
            break;
        case BloodSugarCalender:{
            [_calendarView registerNib:[UINib nibWithNibName:@"TemperatureCell" bundle:nil] forCellWithReuseIdentifier:@"TemperatureCellId"];
        }
            break;
        case BloodPressureCalender:{
            [_calendarView registerNib:[UINib nibWithNibName:@"BloodPressureCell" bundle:nil] forCellWithReuseIdentifier:@"BloodPressureCellId"];
            
        }
            break;
        default:
            break;
    }
    
}
#pragma mark -UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (_calenderType) {
        case ExerciseCalender:{
            ExerciseCalenderCell *calenderCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ExerciseCalenderId" forIndexPath:indexPath];
            calenderCell.dateLabel.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row]];
            if (indexPath.row < _firstWeekday) {
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
            }else if (indexPath.row > _firstWeekday + _daysInThisMonth -1){
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
            }else{
                calenderCell.dateLabel.textColor= [UIColor blackColor];
            }
            return calenderCell;
        }
            break;
        case TemperatureCalender:{
            TemperatureCell *calenderCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TemperatureCellId" forIndexPath:indexPath];
            calenderCell.dateLabel.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row]];
            if (indexPath.row < _firstWeekday) {
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
                calenderCell.temperatureView.hidden = NO;
                calenderCell.temperatureLabel.hidden = NO;
            }else if (indexPath.row > _firstWeekday + _daysInThisMonth -1){
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
                calenderCell.temperatureView.hidden = YES;
                calenderCell.temperatureLabel.hidden = YES;
            }else{
                calenderCell.dateLabel.textColor= [UIColor blackColor];
                calenderCell.temperatureView.hidden = NO;
                calenderCell.temperatureLabel.hidden = NO;
            }
            return calenderCell;
        }
            break;
        case BloodSugarCalender:{
            TemperatureCell *calenderCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TemperatureCellId" forIndexPath:indexPath];
            calenderCell.dateLabel.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row]];
            if (indexPath.row < _firstWeekday) {
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
                calenderCell.temperatureView.hidden = NO;
                calenderCell.temperatureLabel.hidden = NO;
            }else if (indexPath.row > _firstWeekday + _daysInThisMonth -1){
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
                calenderCell.temperatureView.hidden = YES;
                calenderCell.temperatureLabel.hidden = YES;
            }else{
                calenderCell.dateLabel.textColor= [UIColor blackColor];
                calenderCell.temperatureView.hidden = NO;
                calenderCell.temperatureLabel.hidden = NO;
            }
            return calenderCell;
        }
            break;
        case BloodPressureCalender:{
            TemperatureCell *calenderCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BloodPressureCellId" forIndexPath:indexPath];
            calenderCell.dateLabel.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row]];
            if (indexPath.row < _firstWeekday) {
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
            }else if (indexPath.row > _firstWeekday + _daysInThisMonth -1){
                calenderCell.dateLabel.textColor= [UIColor lightGrayColor];
            }else{
                calenderCell.dateLabel.textColor= [UIColor blackColor];
            }
            return calenderCell;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (IBAction)nextMouth:(id)sender {
    //下个月
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    _date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:_date options:0];
    [self initMouthDatyArrayWithData:_date];
    [_calendarView reloadData];
    NSLog(@"~~~~~~下个月~~~~");
}
- (IBAction)lastMouth:(id)sender {
    //上个月
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    _date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:_date options:0];
    [self initMouthDatyArrayWithData:_date];
    [_calendarView reloadData];
     NSLog(@"~~~~~~上个月~~~~");
}



-(void)setCalenderType:(CalenderType)calenderType{
    _calenderType = calenderType;
//    [self createHeadrView];
    [self createCalendarView];
    [self initMouthDatyArrayWithData:_date];
    [_calendarView reloadData];
}

//日历数据处理
- (void)initMouthDatyArrayWithData:(NSDate *)date{
    //  3.days (1-31)
    _dataArray = [[NSMutableArray alloc] init];
    _daysInLastMonth = [HYCalendarTool totaldaysInMonth:[HYCalendarTool lastMonth:date]];
    _daysInThisMonth = [HYCalendarTool totaldaysInMonth:date];
    _firstWeekday    = [HYCalendarTool firstWeekdayInThisMonth:date];
    NSInteger day = 0;
    for (int i = 0 ; i < 42; i++) {
        if (i < _firstWeekday) {
            day = _daysInLastMonth - _firstWeekday + i + 1;
            [_dataArray addObject:[NSString stringWithFormat:@"%ld",day]];
        }else if (i > _firstWeekday + _daysInThisMonth - 1){
            day = i + 1 - _firstWeekday - _daysInThisMonth;
            [_dataArray addObject:[NSString stringWithFormat:@"%ld",day]];
        }else{
            day = i - _firstWeekday + 1;
            [_dataArray addObject:[NSString stringWithFormat:@"%ld",day]];
        }
    }
    _dateTitle.text = [NSString stringWithFormat:@"%d-%d",(int)[HYCalendarTool year:date],(int)[HYCalendarTool month:date]];
}
- (void)addParentController:(UIViewController *)viewController{
    if ([viewController respondsToSelector:@selector(edgesForExtendedLayout)]){
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
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
