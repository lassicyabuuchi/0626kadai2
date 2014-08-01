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

    }
    return self;
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
}


@end
