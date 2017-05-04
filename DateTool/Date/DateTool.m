//
//  DateTool.m
//  Date
//
//  Created by 1hhd on 17/5/4.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "DateTool.h"
typedef NS_ENUM(NSInteger, DateType) {
    Today = 0,
    Yesterday,
    BeforeYesterday,
    Tomorrow
};

@implementation DateTool

+ (NSInteger)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
        return Today;
    else if ([dateString isEqualToString:yesterdayString])
        return Yesterday;
    else if ([dateString isEqualToString:tomorrowString])
        return Tomorrow;
    else
        return -100;
}

+ (NSString *)relativeDateStringForDate:(NSDate *)date{
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitWeekOfYear |
    NSCalendarUnitMonth | NSCalendarUnitYear;
    
    // if `date` is before "now" (i.e. in the past) then the components will be positive
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:date
                                                                     toDate:[NSDate date]
                                                                    options:0];
    
    if (components.year > 0) {
        return [NSString stringWithFormat:@"%ld years ago", (long)components.year];
    } else if (components.month > 0) {
        return [NSString stringWithFormat:@"%ld months ago", (long)components.month];
    } else if (components.weekOfYear > 0) {
        return [NSString stringWithFormat:@"%ld weeks ago", (long)components.weekOfYear];
    } else if (components.day > 0) {
        if (components.day > 1) {
            return [NSString stringWithFormat:@"%ld days ago", (long)components.day];
        } else {
            return @"Yesterday";
        }
    } else {
        return @"Today";
    }
}

+ (NSString *) dateDifference:(NSDate *)date{
    const NSTimeInterval secondsPerDay = 60 * 60 * 24;
    NSTimeInterval diff = [date timeIntervalSinceNow] * -1.0;

    // if the difference is negative, then the given date/time is in the future
    // (because we multiplied by -1.0 to make it easier to follow later)
    if (diff < 0)
        return @"In the future";

    diff /= secondsPerDay; // get the number of days

    // if the difference is less than 1, the date occurred today, etc.
    if (diff < 1)
        return @"Today";
    else if (diff < 2)
        return @"Yesterday";
    else if (diff < 8)
        return @"Last week";
    else
        return [date description]; // use a date formatter if necessary
}

@end
