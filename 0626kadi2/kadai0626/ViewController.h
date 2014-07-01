//
//  ViewController.h
//  kadai0626
//
//  Created by yabuuchi on 2014/06/26.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UILabel *TimeNow;
- (void)onTime:(NSTimer*)timer;

@end
