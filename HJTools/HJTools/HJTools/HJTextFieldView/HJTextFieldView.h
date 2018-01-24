//
//  HJTextFieldView.h
//  HJTools
//
//  Created by 浩杰 on 2018/1/21.
//  Copyright © 2018年 dunyun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 输入框block

 @param text text
 @param editting 是否正在编辑
 */
typedef void(^HJTextFieldViewTextBlock)(NSString *text,BOOL editting);

/**
 按钮Block

 @param button 点击的按钮
 */
typedef void(^HJTextFieldViewButtonBlock)(UIButton *button);


@interface HJTextFieldView : UIView

/**   图标  **/
@property (nonatomic , strong) UIImage *iconImage;

/**   输入框  **/
@property (nonatomic , strong) UITextField *textField;

/**   图标距左边框距离  **/
@property (nonatomic , assign) CGFloat iconToLeftSpace;

/**   图标尺寸，默认为view的高度的一半，即：0.5  **/
@property (nonatomic , assign) CGFloat iconScale;

/**   输入框到图标距离，默认为20像素  **/
@property (nonatomic , assign) CGFloat textFieldToIconSpace;

/**   输入框距有边框距离  **/
@property (nonatomic , assign) CGFloat textToRightSpace;

/**   button  **/
@property (nonatomic , strong) UIButton *button;

/**   是否显示按钮，默认不显示  **/
@property (nonatomic , assign) BOOL isShowButton;

/**   按钮尺寸，宽和告  **/
@property (nonatomic , assign) CGSize buttonSize;

/**   按钮距有边框距离，默认为10像素  **/
@property (nonatomic , assign) CGFloat buttonToRightSpace;

/**
 输入框Block回调

 @param textBlock Block
 */
- (void)textFieldViewForTextEdittingBlock:(HJTextFieldViewTextBlock)textBlock;

/**
 按钮Block回调

 @param buttonBlock Block
 */
- (void)textFieldViewForClickButtonBlock:(HJTextFieldViewButtonBlock)buttonBlock;

@end
