//
//  UIFont+HJFont.m
//  HJTools
//
//  Created by 浩杰 on 2017/7/20.
//  Copyright © 2017年 dunyun. All rights reserved.
//

#import "UIFont+HJFont.h"
#import <objc/runtime.h>


#define maxScale 1.5//最大放大倍数，防止在iPad上字体过大

#define minScale 0.8//最小放大倍数，防止在小屏幕手机上字体过小

#define REFERENCE_W 375//约束参考宽度，也就是UI效果图采用的屏幕宽度

#define REFERENCE_H 667//约束参考高度，也就是UI效果图采用的屏幕高度

@implementation UIFont (HJFont)

+(void)load
{
    //reference
    static dispatch_once_t onceToken;
    //加上这句代码是保证以下代码只运行一次，起到内存优化作用
    dispatch_once(&onceToken, ^{
        
        /** 获取原始systemFontOfSize方法 */
        Method method1 = class_getClassMethod([self class], @selector(systemFontOfSize:));
        
        /** 获取自定义的hj_systemFontOfSize方法 */
        Method newMethod1 = class_getClassMethod([self class], @selector(hj_systemFontOfSize:));
        
        /** 交换方法 */
        method_exchangeImplementations(newMethod1, method1);
        
        
        
        Method method2 = class_getClassMethod([self class], @selector(fontWithName:size:));
        
        /** 获取自定义的hj_systemFontOfSize方法 */
        Method newMethod2 = class_getClassMethod([self class], @selector(hj_fontWithName:size:));
        
        /** 交换方法 */
        method_exchangeImplementations(newMethod2, method2);
        
    });
    
}


+ (UIFont *)hj_systemFontOfSize:(CGFloat)fontSize
{
    
    float a = [UIScreen mainScreen].bounds.size.width/REFERENCE_W;
    float b = [UIScreen mainScreen].bounds.size.height/REFERENCE_H;
    
    CGFloat scale = 1.f;
    
    
    a = a > maxScale ? maxScale : a;
    b = b > maxScale ? maxScale : a;
    
    
    a = a > minScale ? a : minScale;
    b = b > minScale ? b : minScale;
    
    
    
    if (a > 1) {
        scale = a > b ? b : a;
    }
    else
    {
        scale = a < b ? b : a;
    }
    
    return [UIFont hj_systemFontOfSize:fontSize * scale];
}

+ (UIFont *)hj_fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
    float a = [UIScreen mainScreen].bounds.size.width/REFERENCE_W;
    float b = [UIScreen mainScreen].bounds.size.height/REFERENCE_H;
    
    a = a > maxScale ? maxScale : a;
    b = b > maxScale ? maxScale : b;
    
    
    a = a > minScale ? a : minScale;
    b = b > minScale ? b : minScale;
    
    CGFloat scale;
    
    if (a > 1) {
        scale = a > b ? b : a;
    }
    else
    {
        scale = a < b ? b : a;
    }
    
    return [UIFont hj_fontWithName:fontName size:fontSize * scale];
}


@end
