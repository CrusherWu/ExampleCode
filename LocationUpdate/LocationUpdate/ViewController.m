//
//  ViewController.m
//  LocationUpdate
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    CLLocationManager *locationManager;
    CLLocation *newLocation;
    CLLocationCoordinate2D coordinate;
    NSInteger _num;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *dataSource;
@property (strong,nonatomic) NSMutableDictionary *dict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLocation];
    
    _num = 0;
}

-(void)initLocation
{
    locationManager=[[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置定位精度
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        [locationManager requestWhenInUseAuthorization];
    }
    if(![CLLocationManager locationServicesEnabled]){
        NSLog(@"请开启定位:设置 > 隐私 > 位置 > 定位服务");
    }
    if([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization]; // 永久授权
        [locationManager requestWhenInUseAuthorization]; //使用中授权
    }
    locationManager.pausesLocationUpdatesAutomatically = NO;
    [locationManager startUpdatingLocation];
}

#pragma mark -
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    newLocation = [locations lastObject];
    double latitude = newLocation.coordinate.latitude;
    double longitude = newLocation.coordinate.longitude;
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"123.plist"];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"地址：%@",[placemarks firstObject].name);
        NSString *time = [self getCurrentTime];
        _num++;
        time = [NSString stringWithFormat:@"%ld %@",(long)_num,time];
        [self.dict setObject:[placemarks firstObject].name forKey:time];
        [_dict writeToFile:fileName atomically:YES];
    }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
     NSLog(@"error:%@",error);
}

//获取当前时间
-(NSString *)getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyMMddHHmm"];
    NSString*dateTime = [formatter stringFromDate:[NSDate  date]];
    return dateTime;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [UITableViewCell new];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(NSArray *)dataSource
{
    if (!_dataSource) {
        
        _dataSource = [NSArray array];
        
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *fileName = [path stringByAppendingPathComponent:@"123.plist"];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:fileName];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"dic[%@] = %@",key,obj);
            [self.dict setObject:obj forKey:key];
            NSString *tempStr = [NSString stringWithFormat:@"[%@]:%@",key,obj];
            [tempArray addObject:tempStr];
        }];
        _dataSource = [tempArray copy];
    }
    return  _dataSource;
}

-(NSMutableDictionary *)dict
{
    if (!_dict) {
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

@end
