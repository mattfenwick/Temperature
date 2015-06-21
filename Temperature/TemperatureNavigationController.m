//
//  TemperatureNavigationController.m
//  Temperature
//
//  Created by Matthew Fenwick on 6/21/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "TemperatureNavigationController.h"

@interface TemperatureNavigationController ()

@end

@implementation TemperatureNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

@end
