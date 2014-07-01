//
//  ViewController.m
//  kadai0626
//
//  Created by yabuuchi on 2014/06/26.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self selector:@selector(onTime:) userInfo:nil repeats:YES];
    //現在時刻取得
    NSDate* now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm:ss";
    //表示するため文字列に変換する
    NSString *result = [fmt stringFromDate:now];
    self.TimeNow.text = result;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onTime:(NSTimer*)timer {
    //現在時刻取得
    NSDate* now = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm:ss";
    
    //表示するため文字列に変換する
    NSString *result = [fmt stringFromDate:now];
    self.TimeNow.text = result;
    
}

@end
