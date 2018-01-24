//
//  ViewController.m
//  HJTools
//
//  Created by 浩杰 on 2017/7/20.
//  Copyright © 2017年 dunyun. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+HJDate.h"
#import "HJTextFieldView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HJTextFieldView *view = [[HJTextFieldView alloc] init];
    view.frame = CGRectMake(50, 200, self.view.frame.size.width - 100, 50);
    view.textField.placeholder = @"请输入手机号";
    view.layer.cornerRadius = 25;
    view.layer.borderColor = [UIColor greenColor].CGColor;
    view.layer.borderWidth = 1.f;
    view.isShowButton = YES;
    view.iconToLeftSpace = 20.f;
    view.textFieldToIconSpace = 20.f;
    view.buttonSize = CGSizeMake(60, 30);
    view.button.backgroundColor = [UIColor cyanColor];
    [view textFieldViewForTextEdittingBlock:^(NSString *text, BOOL editting) {
        if (editting == YES) {
            view.layer.borderColor = [UIColor blueColor].CGColor;
        }
        else
        {
            view.layer.borderColor = [UIColor greenColor].CGColor;
        }
    }];
    
    [view textFieldViewForClickButtonBlock:^(UIButton *button) {
        button.backgroundColor = [UIColor greenColor];
    }];
    [self.view addSubview:view];
    
//    NSLog(@"weekday : %@",[NSDate getWeekdayWithDate:[NSDate changeDateStringToDate:@"2017-07-24" withDateStringFormat:@"YYYY-MM-dd"]]);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
