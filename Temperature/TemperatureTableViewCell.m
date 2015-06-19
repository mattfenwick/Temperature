//
//  TemperatureTableViewCell.m
//  Temperature
//
//  Created by Matthew Fenwick on 6/19/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "TemperatureTableViewCell.h"

@interface TemperatureTableViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *titlelabel;

@end


@implementation TemperatureTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setNumber:(NSNumber *)number
{
    self.titlelabel.text = [number description];
}

@end
