//
//  FKBDateTools.h
//  biz
//
//  Created by Gaia on 2017/8/4.
//  Copyright © 2017年 Yodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FKBDateTools : NSObject
//每半天计算
-(CGFloat)beginTime:(NSString *)bTime endTime:(NSString *)eTime;
+ (CGFloat)beginFKBTime:(NSString *)bTime endFKBTime:(NSString *)eTime;
//每天计算
+ (NSInteger)startDate:(NSDate *)startDate endDate:(NSDate *)endDate;

//计算月份
+ (NSInteger)startMonthDate:(NSDate *)startMonthDate endMonthDate:(NSDate *)endMonthDate;

//麦德龙津贴次数计算逻辑
+(CGFloat)startDateTime:(NSString *)startDateTime endDateTime:(NSString *)endDateTime;

@end
