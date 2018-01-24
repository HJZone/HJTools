//
//  UIView+HJCornerView.m
//  HJTools
//
//  Created by 浩杰 on 2018/1/23.
//  Copyright © 2018年 dunyun. All rights reserved.
//

#import "UIView+HJCornerView.h"
#import <objc/runtime.h>

static NSString * const HJCornerPositionKey = @"HJCornerPositionKey";
static NSString * const HGCornerRadiusKey = @"HGCornerRadiusKey";
static NSString * const HGCornerBoiderWidthKey = @"HGCornerBoiderWidthKey";
static NSString * const HGCornerBoiderColorKey = @"HGCornerBoiderColorKey";

@implementation UIView (HJCornerView)


@dynamic hj_cornerPosition;

- (HJCornerPosition)hj_cornerPosition
{
    return [objc_getAssociatedObject(self, &HJCornerPositionKey) integerValue];
}

- (void)sethj_cornerPosition:(HJCornerPosition)hj_cornerPosition
{
    objc_setAssociatedObject(self, &HJCornerPositionKey, @(hj_cornerPosition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic hj_cornerRadius;
- (CGFloat)hj_cornerRadius
{
    return [objc_getAssociatedObject(self, &HGCornerRadiusKey) floatValue];
}

- (void)sethj_cornerRadius:(CGFloat)hj_cornerRadius
{
    objc_setAssociatedObject(self, &HGCornerRadiusKey, @(hj_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic hj_borderWidth;
- (CGFloat)hj_borderWidth
{
    return [objc_getAssociatedObject(self, &HGCornerBoiderWidthKey) floatValue];
}
- (void)sethj_borderWidth:(CGFloat)hj_borderWidth
{
    objc_setAssociatedObject(self, &HGCornerBoiderWidthKey, @(hj_borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@dynamic hj_borderColor;
- (UIColor *)hj_borderColor
{
    return objc_getAssociatedObject(self, &HGCornerBoiderColorKey);
}
- (void)sethj_borderColor:(UIColor *)hj_borderColor
{
    objc_setAssociatedObject(self, &HGCornerBoiderColorKey, hj_borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (void)load
{
    SEL ori = @selector(layoutSublayersOfLayer:);
    SEL new = NSSelectorFromString([@"hh_" stringByAppendingString:NSStringFromSelector(ori)]);
    hh_swizzle(self, ori, new);
}

void hh_swizzle(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    method_exchangeImplementations(origMethod, newMethod);
}

- (void)hh_layoutSublayersOfLayer:(CALayer *)layer
{
    [self hh_layoutSublayersOfLayer:layer];
    
    if (self.hj_cornerRadius > 0) {
        
        UIBezierPath *maskPath;
        switch (self.hj_cornerPosition) {
            case HJCornerPositionTop:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(self.hj_cornerRadius, self.hj_cornerRadius)];
                break;
            case HJCornerPositionLeft:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                                       cornerRadii:CGSizeMake(self.hj_cornerRadius, self.hj_cornerRadius)];
                break;
            case HJCornerPositionBottom:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.hj_cornerRadius, self.hj_cornerRadius)];
                break;
            case HJCornerPositionRight:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.hj_cornerRadius, self.hj_cornerRadius)];
                break;
            case HJCornerPositionAll:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:UIRectCornerAllCorners
                                                       cornerRadii:CGSizeMake(self.hj_cornerRadius, self.hj_cornerRadius)];
                break;
        }
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        
        
        
        
        if (self.hj_borderWidth>0) {
            CAShapeLayer *borderLayer=[CAShapeLayer layer];
            borderLayer.path    =   maskPath.CGPath;
            borderLayer.fillColor  = [UIColor clearColor].CGColor;
            borderLayer.strokeColor    = self.hj_borderColor.CGColor;
            borderLayer.lineWidth      = self.hj_borderWidth;
            borderLayer.frame =  self.layer.bounds;
            [ self.layer addSublayer:borderLayer];
            
        }
        
        
        
        
        
        
    }
}

- (void)hj_setCornerOnTopWithRadius:(CGFloat)radius
{
    self.hj_cornerPosition = HJCornerPositionTop;
    self.hj_cornerRadius = radius;
}

- (void)hj_setCornerOnLeftWithRadius:(CGFloat)radius
{
    self.hj_cornerPosition = HJCornerPositionLeft;
    self.hj_cornerRadius = radius;
}

- (void)hj_setCornerOnBottomWithRadius:(CGFloat)radius
{
    self.hj_cornerPosition = HJCornerPositionBottom;
    self.hj_cornerRadius = radius;
}

- (void)hj_setCornerOnRightWithRadius:(CGFloat)radius
{
    self.hj_cornerPosition = HJCornerPositionRight;
    self.hj_cornerRadius = radius;
}

- (void)hj_setAllCornerWithCornerRadius:(CGFloat)radius
{
    self.hj_cornerPosition = HJCornerPositionAll;
    self.hj_cornerRadius = radius;
}

- (void)hj_setAllCornerWithCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth
{
    self.hj_cornerPosition = HJCornerPositionAll;
    self.hj_borderColor = borderColor;
    self.hj_borderWidth = borderWidth;
    self.hj_cornerRadius = radius;
}





- (void)hj_setNoneCorner
{
    self.layer.mask = nil;
}

@end
