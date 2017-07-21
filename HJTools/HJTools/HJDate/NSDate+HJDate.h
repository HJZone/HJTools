//
//  NSDate+HJDate.h
//  HJTools
//
//  Created by 浩杰 on 2017/7/21.
//  Copyright © 2017年 dunyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HJDate)


#pragma -mark  获取十六进制时间戳

/**
 获取当前十六进制时间戳，默认小写字母

 @return 8位十六进制时间戳
 */
+ (NSString *)getCurrentHexadecimalTimestamp;

/**
 获取指定日期的十六进制时间戳 8位 不足8位的前边补0
 
 @param date date
 @return 十六进制时间戳 8位
 */
+ (NSString *)getHexadecimalTimestampWithDate:(NSDate *)date;

/**
 获取指定日期的十六进制时间戳 8位 不足8位的前边补0
 
 @param dateString 时间字符串，默认格式为：yyyy-MM-dd HH:mm:ss
 @return 十六进制时间戳 8位
 */
+ (NSString *)getHexadecimalTimestampWithDateString:(NSString *)dateString;

/**
 获取指定格式时间字符串的十六进制时间戳 8位 不足8位的前边补0
 
 @param dateString 时间字符串
 @param formatString 时间字符串的格式
 @return 十六进制时间戳 8位
 */
+ (NSString *)getHexadecimalTimestampWithDateString:(NSString *)dateString withDateFormatString:(NSString *)formatString;

#pragma -mark  获取十进制时间戳

/**
 获取当前时间戳  十进制  长度为10

 @return 10位十进制时间戳
 */
+ (NSTimeInterval)getCurrentTimestamp;

/**
 获取指定日期的十进制时间戳 10位
 
 @param date date
 @return 十进制时间戳
 */
+ (NSTimeInterval)getTimestampWithDate:(NSDate *)date;

/**
 获取指定日期的十进制时间戳
 
 @param dateString 时间字符串，默认格式为：yyyy-MM-dd HH:mm:ss
 @return 十进制时间戳
 */
+ (NSTimeInterval)getTimestampWithDateString:(NSString *)dateString;

/**
 获取指定格式时间字符串的十进制时间戳
 
 @param dateString 时间字符串
 @param formatString 时间字符串的格式
 @return 十进制时间戳
 */
+ (NSTimeInterval)getTimestampWithDateString:(NSString *)dateString withDateFormatString:(NSString *)formatString;

#pragma -mark 获取时间


/**
 获取当前时间字符串 默认格式为：yyyy-MM-dd HH:mm:ss

 @return 当前时间
 */
+ (NSString *)getCurrentDateString;

/**
 获取当前时间指定类型的时间字符串

 @param formatString 时间格式
 @return 当前时间
 */
+ (NSString *)getCurrentDateStringWithFormatString:(NSString *)formatString;

/**
 获取明天时间字符串 默认格式为：yyyy-MM-dd HH:mm:ss

 @return 明天时间
 */
+ (NSString *)getTomorrowDateString;

/**
 获取指定类型的明天时间

 @param formatString 时间格式
 @return 明天时间
 */
+ (NSString *)getTomorrowDateStringWithFormatString:(NSString *)formatString;

/**
 获取今天是星期几

 @return 一、二、三、四、五、六、日
 */
+ (NSString *)getTodayTheWeek;


/**
 根据日期获取星期几

 @param date 日期
 @return 星期几，一、二、三、四、五、六、日
 */
+ (NSString *)getWeekdayWithDate:(NSDate *)date;

/**
 根据指定类型的时间格式获取星期几

 @param dateString 时间字符串
 @param dateFormat 时间格式
 @return 星期几，一、二、三、四、五、六、日
 */
+ (NSString *)getWeekdayWithDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

#pragma -mark 相互转换

/**
 把时间字符串转换为NSDate类型

 @param dateString 时间字符串
 @param formatString 时间字符串的格式
 @return date
 */
+ (NSDate *)changeDateStringToDate:(NSString *)dateString withDateStringFormat:(NSString *)formatString;

/**
 把十进制时间戳转换为时间字符串

 @param timestamp 时间戳
 @return 时间
 */
+ (NSString *)changeTimestampsToDateStringWithTimestamps:(NSTimeInterval)timestamp;

/**
 把十六进制时间戳转化为时间

 @param timestamp 时间戳
 @return 时间
 */
+ (NSString *)changeHexadecimalTimestampsToDateStringWithTimestamps:(NSString *)timestamp;

@end
