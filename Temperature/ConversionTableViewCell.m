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

// see:
//   http://stackoverflow.com/questions/25770119/ios-8-uitableview-separator-inset-0-not-working
- (UIEdgeInsets)layoutMargins
{
    return UIEdgeInsetsZero;
}

@end
