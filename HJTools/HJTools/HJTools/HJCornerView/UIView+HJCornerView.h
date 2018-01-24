//
//  UIView+HJCornerView.h
//  HJTools
//
//  Created by 浩杰 on 2018/1/23.
//  Copyright © 2018年 dunyun. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, HJCornerPosition) {
    HJCornerPositionTop,
    HJCornerPositionLeft,
    HJCornerPositionBottom,
    HJCornerPositionRight,
    HJCornerPositionAll
};

@interface UIView (HJCornerView)

@property (nonatomic, assign) HJCornerPosition hj_cornerPosition;
@property (nonatomic, assign) CGFloat hj_cornerRadius;
@property (nonatomic, assign) CGFloat hj_borderWidth;
@property (nonatomic, strong) UIColor *hj_borderColor;

- (void)hj_setCornerOnTopWithRadius:(CGFloat)radius;
- (void)hj_setCornerOnLeftWithRadius:(CGFloat)radius;
- (void)hj_setCornerOnBottomWithRadius:(CGFloat)radius;
- (void)hj_setCornerOnRightWithRadius:(CGFloat)radius;
- (void)hj_setAllCornerWithCornerRadius:(CGFloat)radius;
- (void)hj_setAllCornerWithCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;
- (void)hj_setNoneCorner;
@end
