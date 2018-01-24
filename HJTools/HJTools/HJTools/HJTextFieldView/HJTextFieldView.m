//
//  HJTextFieldView.m
//  HJTools
//
//  Created by 浩杰 on 2018/1/21.
//  Copyright © 2018年 dunyun. All rights reserved.
//

#import "HJTextFieldView.h"


@interface HJTextFieldView ()<UITextFieldDelegate>

/**   buttonBlock  **/
@property (nonatomic , copy) HJTextFieldViewButtonBlock buttonBlock;

/**   textBlock  **/
@property (nonatomic , copy) HJTextFieldViewTextBlock textBlock;

/**   rect  **/
@property (nonatomic , assign) CGRect viewFrame;

/**   icon imageView  **/
@property (nonatomic , strong) UIImageView *imageView;


@end


@implementation HJTextFieldView


- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _iconToLeftSpace = 10.f;
        _iconScale = 0.5f;
        _textFieldToIconSpace = 10.f;
        _textToRightSpace = 15.f;
        _isShowButton = NO;
        _buttonSize = CGSizeZero;
        _buttonToRightSpace = 15.f;
        [self setUpUI];
    }
    
    return self;
}

- (void)setUpUI
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor greenColor];
        [self addSubview:_imageView];
    }
    
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textField];
    }
    
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(buttonClockAction:) forControlEvents:UIControlEventTouchUpInside];
        _button.enabled = NO;
        _button.alpha = 0.f;
        [self addSubview:_button];
    }
    
    [self updateImageViewFrame];
    [self updateTextFieldFrame];
    [self updateButtonFrame];
}

- (void)updateImageViewFrame
{
    _imageView.frame = CGRectMake(_iconToLeftSpace, (_viewFrame.size.height - _viewFrame.size.height * _iconScale) / 2, _viewFrame.size.height * _iconScale, _viewFrame.size.height * _iconScale);
}

- (void)updateTextFieldFrame
{
    _textField.frame = CGRectMake(_imageView.frame.size.width + _imageView.frame.origin.x + _textFieldToIconSpace, 0, _viewFrame.size.width - _textToRightSpace - (_imageView.frame.size.width + _imageView.frame.origin.x + _textFieldToIconSpace - _buttonSize.width), _viewFrame.size.height);
}

- (void)updateButtonFrame
{
    _button.frame = CGRectMake(_viewFrame.size.width - _buttonToRightSpace - _buttonSize.width, (_viewFrame.size.height - _buttonSize.height) / 2, _buttonSize.width, _buttonSize.height);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _viewFrame = frame;
        _iconToLeftSpace = 10.f;
        _iconScale = 0.5f;
        _textFieldToIconSpace = 10.f;
        _textToRightSpace = 15.f;
        _isShowButton = NO;
        _buttonSize = CGSizeZero;
        _buttonToRightSpace = 15.f;
        [self setUpUI];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _viewFrame = frame;
    [self updateImageViewFrame];
    [self updateTextFieldFrame];
    [self updateButtonFrame];
}

- (void)setIconScale:(CGFloat)iconScale
{
    _iconScale = iconScale;
    [self updateImageViewFrame];
    [self updateTextFieldFrame];
}

- (void)setIconToLeftSpace:(CGFloat)iconToLeftSpace
{
    _iconToLeftSpace = iconToLeftSpace;
    [self updateImageViewFrame];
    [self updateTextFieldFrame];
}

- (void)setTextFieldToIconSpace:(CGFloat)textFieldToIconSpace
{
    _textFieldToIconSpace = textFieldToIconSpace;
    [self updateTextFieldFrame];
}

- (void)setTextToRightSpace:(CGFloat)textToRightSpace
{
    _textToRightSpace = textToRightSpace;
    [self updateTextFieldFrame];
}

- (void)setButtonSize:(CGSize)buttonSize
{
    _buttonSize = buttonSize;
    [self updateTextFieldFrame];
    [self updateButtonFrame];
}

- (void)setButtonToRightSpace:(CGFloat)buttonToRightSpace
{
    _buttonToRightSpace = buttonToRightSpace;
    [self updateButtonFrame];
}

- (void)setIsShowButton:(BOOL)isShowButton
{
    _isShowButton = isShowButton;
    if (isShowButton == YES) {
        _button.enabled = YES;
        _button.alpha = 1.f;
    }
    else
    {
        _button.enabled = NO;
        _button.alpha = 0.f;
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_textBlock) {
        _textBlock(textField.text,YES);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_textBlock) {
        _textBlock(textField.text,NO);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

- (void)buttonClockAction:(UIButton *)sender
{
    if (_buttonBlock) {
        _buttonBlock(sender);
    }
}

/**
 输入框Block回调
 
 @param textBlock Block
 */
- (void)textFieldViewForTextEdittingBlock:(HJTextFieldViewTextBlock)textBlock;
{
    if (textBlock) {
        _textBlock = textBlock;
    }
}
/**
 按钮Block回调
 
 @param buttonBlock Block
 */
- (void)textFieldViewForClickButtonBlock:(HJTextFieldViewButtonBlock)buttonBlock;
{
    if (buttonBlock) {
        _buttonBlock = buttonBlock;
    }
}
@end
