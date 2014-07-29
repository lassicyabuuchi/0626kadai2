//
//  CustomTableViewCell.m
//  kadai0626
//
//  Created by yabuuchi on 2014/07/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected == YES) {
        self.contentView.backgroundColor = [UIColor greenColor];
        self.textLabel.textColor = [UIColor whiteColor];
    }
    else{
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.textLabel.textColor = [UIColor blackColor];
    }
    // Configure the view for the selected state
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//    
//    NSDate *now = [NSDate date];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger flags;
//    NSDateComponents *comps;
//    
//    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
//    comps = [calendar components:flags fromDate:now];
//    //    comps.day = indexPath.row +1;
//    
//    NSInteger day;
//    day = comps.day;
//    
//    NSInteger date = indexPath.row + 1;
//    
//    if (date == comps.day) {
//        self.contentView.backgroundColor = [UIColor greenColor];
//        self.textLabel.textColor = [UIColor redColor];
//    }
//    else{
//        if (selected == YES) {
//            self.contentView.backgroundColor = [UIColor greenColor];
//            self.textLabel.textColor = [UIColor whiteColor];
//        }
//        else{
//            self.contentView.backgroundColor = [UIColor clearColor];
//            self.textLabel.textColor = [UIColor blackColor];
//        }
//    }
//    
//    // Configure the view for the selected state
//}

@end
