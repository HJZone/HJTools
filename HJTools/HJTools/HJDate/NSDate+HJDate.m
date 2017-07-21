//
//  NSDate+HJDate.m
//  HJTools
//
//  Created by 浩杰 on 2017/7/21.
//  Copyright © 2017年 dunyun. All rights reserved.
//

#import "NSDate+HJDate.h"

@implementation NSDate (HJDate)

/**
 将十进制转化为十六进制
 
 @param ascii 10进制  int类型
 @return 16进制
 */
+ (NSString*)changASCIIToHEX:(NSInteger)ascii
{
    NSString* intAscii = [[NSString alloc] initWithFormat:@"%1lx", (long)ascii];
    NSString* hex = [NSString stringWithFormat:@"%@", intAscii];
    
    if (hex.length == 5) {
        return [[NSString stringWithFormat:@"0%@",hex] uppercaseString];
    }
    else {
        return [hex uppercaseString];
    }
}

/**
 将十六进制转化为十进制
 
 @param str 16进制 nsstring类型
 @return 10进制
 */
+ (NSInteger)changHEXToASCII:(NSString*)str
{
    NSString* temp10 = [NSString stringWithFormat:@"%lu", strtoul([str UTF8String], 0, 16)];
    int cycleNumber = [temp10 intValue];
    
    return cycleNumber;
}

#pragma -mark  获取十六进制时间戳

/**
 获取当前十六进制时间戳，默认小写字母
 
 @return 8位十六进制时间戳
 */
+ (NSString *)getCurrentHexadecimalTimestamp
{
    return [self changASCIIToHEX:[self getCurrentTimestamp]];
}

/**
 获取指定日期的十六进制时间戳 8位 不足8位的前边补0
 
 @param date date
 @return 十六进制时间戳 8位
 */
+ (NSString *)getHexadecimalTimestampWithDate:(NSDate *)date
{
    return [self changASCIIToHEX:[self getTimestampWithDate:date]];
}

/**
 获取指定日期的十六进制时间戳 8位 不足8位的前边补0
 
 @param dateString 时间字符串，默认格式为：yyyy-MM-dd HH:mm:ss
 @return 十六进制时间戳 8位
 */
+ (NSString *)getHexadecimalTimestampWithDateString:(NSString *)dateString
{
    return [self changASCIIToHEX:[self getTimestampWithDateString:dateString]];
}

/**
 获取指定格式时间字符串的十六进制时间戳 8位 不足8位的前边补0
 
 @param dateString 时间字符串
 @param formatString 时间字符串的格式
 @return 十六进制时间戳 8位
 */
+ (NSString *)getHexadecimalTimestampWithDateString:(NSString *)dateString withDateFormatString:(NSString *)formatString
{
    return [self changASCIIToHEX:[self getTimestampWithDateString:dateString withDateFormatString:formatString]];
}

#pragma -mark  获取十进制时间戳

/**
 获取当前时间戳  十进制  长度为10
 
 @return 10位十进制时间戳
 */
+ (NSTimeInterval)getCurrentTimestamp
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return [localeDate timeIntervalSince1970];
}

/**
 获取指定日期的十进制时间戳 10位
 
 @param date date
 @return 十进制时间戳
 */
+ (NSTimeInterval)getTimestampWithDate:(NSDate *)date
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return [localeDate timeIntervalSince1970];
}

/**
 获取指定日期的十进制时间戳
 
 @param dateString 时间字符串，默认格式为：yyyy-MM-dd HH:mm:ss
 @return 十进制时间戳
 */
+ (NSTimeInterval)getTimestampWithDateString:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self getTimestampWithDate:date];
}

/**
 获取指定格式时间字符串的十进制时间戳
 
 @param dateString 时间字符串
 @param formatString 时间字符串的格式
 @return 十进制时间戳
 */
+ (NSTimeInterval)getTimestampWithDateString:(NSString *)dateString withDateFormatString:(NSString *)formatString
{
    if (formatString == nil) {
        formatString = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatString;
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self getTimestampWithDate:date];
}

#pragma -mark 获取时间


/**
 获取当前时间字符串 默认格式为：yyyy-MM-dd HH:mm:ss
 
 @return 当前时间
 */
+ (NSString *)getCurrentDateString
{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    return dateString;
}

/**
 获取当前时间指定类型的时间字符串
 
 @param formatString 时间格式
 @return 当前时间
 */
+ (NSString *)getCurrentDateStringWithFormatString:(NSString *)formatString
{
    if (formatString == nil) {
        formatString = @"YYYY-MM-dd HH:mm:ss";
    }
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    return dateString;
}

/**
 获取明天时间字符串 默认格式为：yyyy-MM-dd HH:mm:ss
 
 @return 明天时间
 */
+ (NSString *)getTomorrowDateString
{
    NSDate *date = [NSDate dateWithTimeInterval:24 * 60 * 60 sinceDate:[NSDate date]];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

/**
 获取指定类型的明天时间
 
 @param formatString 时间格式
 @return 明天时间
 */
+ (NSString *)getTomorrowDateStringWithFormatString:(NSString *)formatString
{
    if (formatString == nil) {
        formatString = @"YYYY-MM-dd HH:mm:ss";
    }
    NSDate *date = [NSDate dateWithTimeInterval:24 * 60 * 60 sinceDate:[NSDate date]];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

/**
 获取今天是星期几
 
 @return 一、二、三、四、五、六、日
 */
+ (NSString *)getTodayTheWeek
{
    NSDate *date = [NSDate date]; // 获得时间对象
    
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    
    forMatter.dateStyle = NSDateFormatterFullStyle;
    
    NSLog(@"date : %@",[forMatter stringFromDate:date]);
    
    NSString *dateStr = [[[forMatter stringFromDate:date] componentsSeparatedByString:@"星期"] lastObject];
    return dateStr;
}

/**
 根据日期获取星期几
 
 @param date 日期
 @return 星期几，一、二、三、四、五、六、日
 */
+ (NSString *)getWeekdayWithDate:(NSDate *)date
{
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    
    forMatter.dateStyle = NSDateFormatterFullStyle;
    
    NSString *dateStr = [[[forMatter stringFromDate:date] componentsSeparatedByString:@"星期"] lastObject];
    return dateStr;
}

/**
 根据指定类型的时间格式获取星期几
 
 @param dateString 时间字符串
 @param dateFormat 时间格式
 @return 星期几，一、二、三、四、五、六、日
 */
+ (NSString *)getWeekdayWithDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat
{
    return [self getWeekdayWithDate:[self changeDateStringToDate:dateString withDateStringFormat:dateFormat]];
}


#pragma -mark 相互转换

/**
 把时间字符串转换为NSDate类型
 
 @param dateString 时间字符串
 @param formatString 时间字符串的格式
 @return date
 */
+ (NSDate *)changeDateStringToDate:(NSString *)dateString withDateStringFormat:(NSString *)formatString
{
    if (formatString == nil) {
        formatString = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatString;
    return [dateFormatter dateFromString:dateString];
}

/**
 把十进制时间戳转换为时间字符串
 
 @param timestamp 时间戳
 @return 时间
 */
+ (NSString *)changeTimestampsToDateStringWithTimestamps:(NSTimeInterval)timestamp
{
    if (timestamp < 80000) {
        return @"";
    }
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];//创建一个日期格式化器
    
    dateFormatter.dateFormat=@"yyyy-MM-dd HH:mm:ss";//指定转date得日期格式化形式
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    return [dateFormatter stringFromDate:date];
}

/**
 把十六进制时间戳转化为时间
 
 @param timestamp 时间戳
 @return 时间
 */
+ (NSString *)changeHexadecimalTimestampsToDateStringWithTimestamps:(NSString *)timestamp
{
    return [self changeTimestampsToDateStringWithTimestamps:[self changHEXToASCII:timestamp]];
}



@end
