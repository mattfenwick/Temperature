//
//  ConversionTableViewCell.m
//  Temperature
//
//  Created by Matthew Fenwick on 6/19/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "ConversionTableViewCell.h"

@interface ConversionTableViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@end


@implementation ConversionTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setTitleText:(NSString *)titleText
{
    _titleText = titleText;
    self.titleLabel.text = _titleText;
}

@end
