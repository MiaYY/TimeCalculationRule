//
//  FKBDateTools.m
//  biz
//
//  Created by Gaia on 2017/8/4.
//  Copyright © 2017年 Yodoo. All rights reserved.
//

#import "FKBDateTools.h"

@implementation FKBDateTools

-(CGFloat)beginTime:(NSString *)bTime endTime:(NSString *)eTime{
    NSArray *bArray = [bTime componentsSeparatedByString:@" "];
    NSArray *eArray = [eTime componentsSeparatedByString:@" "];
    
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [Formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *bDate = [Formatter dateFromString:bTime];
    NSDate *eDate = [Formatter dateFromString:eTime];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *bDate5 = [dateFormatter dateFromString:bArray.firstObject];
    NSDate *eDate5 = [dateFormatter dateFromString:eArray.firstObject];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:bDate5  toDate:eDate5  options:0];
    CGFloat time = 0;
    BOOL bTimeAF = NO;//是否上午出发
    BOOL eTimeAF = NO;//是否上午回来
    NSDate *bDate1 = [bDate earlierDate:[Formatter dateFromString:[NSString stringWithFormat:@"%@ 12:00",bArray.firstObject]]];
    
    NSDate *eDate1 = [eDate earlierDate:[Formatter dateFromString:[NSString stringWithFormat:@"%@ 12:00",eArray.firstObject]]];
    if ([comps day] == 0) {
        if ([bDate isEqualToDate:bDate1]) {
            bTimeAF = YES;
        }
        if ([eDate isEqualToDate:eDate1]) {
            eTimeAF = YES;
        }
        if (bTimeAF && eTimeAF) {//上午出发 上午回来
            time = 0.5;
        }else if (bTimeAF && eTimeAF == NO){//上午出发 下午回来
            time = 1.0;
        }else if (!bTimeAF && !eTimeAF){//下午出发 下午回来
            time = 0.5;
        }else if (bTimeAF == NO && eTimeAF){//下午出发 上午回来
            time = 0;
        }
    }else{
        
        if ([bDate isEqualToDate:bDate1]) {
            
            bTimeAF = YES;
        }
        if ([eDate isEqualToDate:eDate1]) {
            
            eTimeAF = YES;
        }
        if (bTimeAF && eTimeAF) {//上午出发 上午回来
            
            time = 0.5;
            
        }else if (bTimeAF && eTimeAF == NO){//上午出发 下午回来
            
            time = 1.0;
            
        }else if (!bTimeAF && !eTimeAF){//下午出发 下午回来
            
            time = 0.5;
            
        }else if (bTimeAF == NO && eTimeAF){//下午出发 上午回来
            
            time = 0;
        }
    }
    return [comps day] + time;
}

+ (CGFloat)beginFKBTime:(NSString *)bTime endFKBTime:(NSString *)eTime{
    NSArray *bArray = [bTime componentsSeparatedByString:@" "];
    NSArray *eArray = [eTime componentsSeparatedByString:@" "];
    
    NSDateFormatter *Formatter=[[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [Formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *bDate = [Formatter dateFromString:bTime];
    NSDate *eDate = [Formatter dateFromString:eTime];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *bDate5 = [dateFormatter dateFromString:bArray.firstObject];
    NSDate *eDate5 = [dateFormatter dateFromString:eArray.firstObject];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:bDate5  toDate:eDate5  options:0];
    CGFloat time = 0;
    BOOL bTimeAF = NO;//是否上午出发
    BOOL eTimeAF = NO;//是否上午回来
    NSDate *bDate1 = [bDate earlierDate:[Formatter dateFromString:[NSString stringWithFormat:@"%@ 12:00",bArray.firstObject]]];
    
    NSDate *eDate1 = [eDate earlierDate:[Formatter dateFromString:[NSString stringWithFormat:@"%@ 12:00",eArray.firstObject]]];
    if ([comps day] == 0) {
        if ([bDate isEqualToDate:bDate1]) {
            bTimeAF = YES;
        }
        if ([eDate isEqualToDate:eDate1]) {
            eTimeAF = YES;
        }
        if (bTimeAF && eTimeAF) {//上午出发 上午回来
            time = 0.5;
        }else if (bTimeAF && eTimeAF == NO){//上午出发 下午回来
            time = 1.0;
        }else if (!bTimeAF && !eTimeAF){//下午出发 下午回来
            time = 0.5;
        }else if (bTimeAF == NO && eTimeAF){//下午出发 上午回来
            time = 0;
        }
    }else{
        
        if ([bDate isEqualToDate:bDate1]) {
            
            bTimeAF = YES;
        }
        if ([eDate isEqualToDate:eDate1]) {
            
            eTimeAF = YES;
        }
        if (bTimeAF && eTimeAF) {//上午出发 上午回来
            
            time = 0.5;
            
        }else if (bTimeAF && eTimeAF == NO){//上午出发 下午回来
            
            time = 1.0;
            
        }else if (!bTimeAF && !eTimeAF){//下午出发 下午回来
            
            time = 0.5;
            
        }else if (bTimeAF == NO && eTimeAF){//下午出发 上午回来
            
            time = 0;
        }
    }
    return [comps day] + time;
}

//麦德龙计算津贴次数规则
+(CGFloat)startDateTime:(NSString *)startDateTime endDateTime:(NSString *)endDateTime {
    if (startDateTime.length > 0 && startDateTime.length > 10 && endDateTime.length > 0 && endDateTime.length > 10) {
        //先计算两个日期之间的天数
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateStart = startDateTime;
        NSString *dateEnd = endDateTime;
        dateStart = [dateStart substringToIndex:10];
        dateEnd = [dateEnd substringToIndex:10];
        float days = 0.0;
        if ([dateStart isEqualToString:dateEnd]) {//同一天
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            NSString *hourStart = startDateTime;
            NSString *hourEnd = endDateTime;
            NSDate *hourStartDate = [formatter dateFromString:hourStart];
            NSDate *hourEndDate = [formatter dateFromString:hourEnd];
            NSLog(@"hourStartDate:%@  hourEndDate:%@",hourStartDate,hourEndDate);
            NSCalendar *calendar = [NSCalendar currentCalendar];
            unsigned int unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
            NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:hourStartDate toDate:hourEndDate options:0];
            NSLog(@"餐费(津贴)时长:%.lf天%.lf小时%.lf分%.lf秒",(float)[dateComponents day],(float)[dateComponents hour],(float)[dateComponents minute],(float)[dateComponents second]);
            float hour = (float)[dateComponents hour];
            float minutes = (float)[dateComponents minute];
            float minuHour = minutes / 60.0;
            NSLog(@"hour:%lf  minutes:%lf  minuHour:%lf",hour,minutes,minuHour);
            float hourValue = hour + minuHour;
            if (hourValue > 12.0) {
                days = 1.0;
            } else {
                days = 0.5;
            }
        } else {//不是同一天
            NSDate *startDate = [dateFormatter dateFromString:dateStart];
            NSDate *endDate = [dateFormatter dateFromString:dateEnd];
            NSInteger wholeDays = [self startDate:startDate endDate:endDate];
            NSLog(@"两个日期之间的天数%ld",wholeDays);
            //时
            NSString *startTime = startDateTime;
            startTime = [startTime substringFromIndex:11];
            startTime = [startTime substringToIndex:2];
            NSLog(@"开始时数值:%@",startTime);
            NSString *endTime = endDateTime;
            endTime = [endTime substringFromIndex:11];
            endTime = [endTime substringToIndex:2];
            NSLog(@"结束时数值:%@",endTime);
            
            int timeStart = [startTime intValue];
            NSLog(@"开始时int数值:%d",timeStart);
            int timeEnd = [endTime intValue];
            NSLog(@"结束时int数值:%d",timeEnd);
            //开始时间的小时和12比较，小于12算1天，否则算半天，结束时间的小时和12比较，小于12算半天，等于12（看分钟，分钟大于0算1天，等于0算半天）
            float startDay = 0.0;
            float endDay = 0.0;
            if (timeStart > 12) {
                startDay = 0.5;
            } else {
                startDay = 1.0;
            }
            
            NSString *endSeconds = endDateTime;
            endSeconds = [endSeconds substringFromIndex:14];
            int secondsEnd = [endSeconds intValue];
            NSLog(@"结束分数值:%@",endSeconds);
            NSLog(@"结束分int数值:%d",secondsEnd);
            //大的范围用时和12比较
            if (timeEnd > 12) {//大于12
                endDay = 1.0;
            } else if (timeEnd < 12) {//小于12
                if (timeEnd == 0) {//当时为0时判断分
                    if (secondsEnd > 0) {//分大于0时算半天
                        endDay = 0.5;
                    } else {
                        endDay = 0.0;
                    }
                } else {
                    endDay = 0.5;
                }
                
            } else { //等于12时
                //分
                if (secondsEnd > 0) {
                    endDay = 1.0;
                } else {
                    endDay = 0.5;
                }
            }
            days = (wholeDays - 1) + startDay + endDay;
        }
        return days;
    }
    return 0.0;
}

//每天计算
+ (NSInteger)startDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents * comp = [calendar components:NSCalendarUnitDay
                                          fromDate:startDate
                                            toDate:endDate
                                           options:NSCalendarWrapComponents];
    NSLog(@" -- >>  comp : %@  << --",comp);
    return comp.day;
}

//计算月份
+ (NSInteger)startMonthDate:(NSDate *)startMonthDate endMonthDate:(NSDate *)endMonthDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents * comp = [calendar components:NSCalendarUnitDay
                                          fromDate:startMonthDate
                                            toDate:endMonthDate
                                           options:NSCalendarWrapComponents];
    NSLog(@" -- >>  comp : %@  << --",comp);
    return comp.month;
}

/* 麦德龙计算津贴次数规则
 //先计算两个日期之间的天数
 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
 [dateFormatter setDateFormat:@"yyyy-MM-dd"];
 NSString *dateStart = self.BIZ_DATE_FROM_STR_Cell.mInputTextField.text;
 NSString *dateEnd = self.BIZ_DATE_TO_STR_Cell.mInputTextField.text;
 dateStart = [dateStart substringToIndex:10];
 dateEnd = [dateEnd substringToIndex:10];
 
 if ([dateStart isEqualToString:dateEnd]) {//同一天
 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
 [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
 NSString *hourStart = self.BIZ_DATE_FROM_STR_Cell.mInputTextField.text;
 NSString *hourEnd = self.BIZ_DATE_TO_STR_Cell.mInputTextField.text;
 NSDate *hourStartDate = [formatter dateFromString:hourStart];
 NSDate *hourEndDate = [formatter dateFromString:hourEnd];
 NSLog(@"hourStartDate:%@  hourEndDate:%@",hourStartDate,hourEndDate);
 NSCalendar *calendar = [NSCalendar currentCalendar];
 unsigned int unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
 NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:hourStartDate toDate:hourEndDate options:0];
 NSLog(@"餐费(津贴)时长:%.lf天%.lf小时%.lf分%.lf秒",(float)[dateComponents day],(float)[dateComponents hour],(float)[dateComponents minute],(float)[dateComponents second]);
 float hour = (float)[dateComponents hour];
 float minutes = (float)[dateComponents minute];
 float minuHour = minutes / 60.0;
 NSLog(@"hour:%lf  minutes:%lf  minuHour:%lf",hour,minutes,minuHour);
 float hourValue = hour + minuHour;
 float days = 0.0;
 if (hourValue > 12.0) {
 days = 1.0;
 } else {
 days = 0.5;
 }
 self.BIZ_NUM_Cell.mInputTextField.text = [NSString stringWithFormat:@"%.1f",days];
 } else {//不是同一天
 NSDate *startDate = [dateFormatter dateFromString:dateStart];
 NSDate *endDate = [dateFormatter dateFromString:dateEnd];
 NSInteger days = [FKBDateTools startDate:startDate endDate:endDate];
 NSLog(@"两个日期之间的天数%ld",days);
 //时
 NSString *startTime = self.BIZ_DATE_FROM_STR_Cell.mInputTextField.text;
 startTime = [startTime substringFromIndex:11];
 startTime = [startTime substringToIndex:2];
 NSLog(@"开始时数值:%@",startTime);
 NSString *endTime = self.BIZ_DATE_TO_STR_Cell.mInputTextField.text;
 endTime = [endTime substringFromIndex:11];
 endTime = [endTime substringToIndex:2];
 NSLog(@"结束时数值:%@",endTime);
 
 int timeStart = [startTime intValue];
 NSLog(@"开始时int数值:%d",timeStart);
 int timeEnd = [endTime intValue];
 NSLog(@"结束时int数值:%d",timeEnd);
 //开始时间的小时和12比较，小于12算1天，否则算半天，结束时间的小时和12比较，小于12算半天，等于12（看分钟，分钟大于0算1天，等于0算半天）
 float startDay = 0.0;
 float endDay = 0.0;
 if (timeStart > 12) {
 startDay = 0.5;
 } else {
 startDay = 1.0;
 }
 NSString *endSeconds = self.BIZ_DATE_TO_STR_Cell.mInputTextField.text;
 endSeconds = [endSeconds substringFromIndex:14];
 int secondsEnd = [endSeconds intValue];
 NSLog(@"结束分数值:%@",endSeconds);
 NSLog(@"结束分int数值:%d",secondsEnd);
 //大的范围用时和12比较
 if (timeEnd > 12) {//大于12
 endDay = 1.0;
 } else if (timeEnd < 12) {//小于12
 if (timeEnd == 0) {//当时为0时判断分
 if (secondsEnd > 0) {//分大于0时算半天
 endDay = 0.5;
 } else {
 endDay = 0.0;
 }
 } else {
 endDay = 0.5;
 }
 
 } else { //等于12时
 //分
 if (secondsEnd > 0) {
 endDay = 1.0;
 } else {
 endDay = 0.5;
 }
 }
 
 self.BIZ_NUM_Cell.mInputTextField.text = [NSString stringWithFormat:@"%.1f",(days - 1) + startDay + endDay];
 }
 */

@end
