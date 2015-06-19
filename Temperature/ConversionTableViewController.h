//
//  ConversionTableViewController.h
//  Temperature
//
//  Created by Matthew Fenwick on 5/25/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, ConversionType)
{
    ConversionTypeCelsiusToFahrenHeit,
    ConversionTypeFahrenheitToCelsius
};


@class ConversionTableViewController;


@protocol ConversionTableViewControllerDelegate <NSObject>

- (void)conversionControllerDidExit:(ConversionTableViewController *)controller;

@end


@interface ConversionTableViewController : UITableViewController

- (instancetype)initWithConversionType:(ConversionType)type;

@property (nonatomic, weak) id<ConversionTableViewControllerDelegate> delegate;

@end
