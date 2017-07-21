//
//  ViewController.m
//  HJTools
//
//  Created by 浩杰 on 2017/7/20.
//  Copyright © 2017年 dunyun. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+HJDate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"weekday : %@",[NSDate getWeekdayWithDate:[NSDate changeDateStringToDate:@"2017-07-24" withDateStringFormat:@"YYYY-MM-dd"]]);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
