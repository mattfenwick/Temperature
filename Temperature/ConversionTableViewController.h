//
//  ConversionTableViewController.h
//  Temperature
//
//  Created by Matthew Fenwick on 6/19/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ConversionTableViewController;


@protocol ConversionTableViewControllerDelegate <NSObject>

- (void)conversionControllerDidExit:(ConversionTableViewController *)controller;

@end


@interface ConversionTableViewController : UITableViewController

@property (nonatomic) NSInteger number;
@property (nonatomic, weak) id<ConversionTableViewControllerDelegate> delegate;

@end
