//
//  ViewController.m
//  Temperature
//
//  Created by Matthew Fenwick on 5/25/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "ViewController.h"
#import "ConversionTableViewController.h"

@interface ViewController () <ConversionTableViewControllerDelegate>

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)didTapCelsiusToFahrenheit:(id)sender
{
    [self presentConversionViewControllerWithConversionType:ConversionTypeCelsiusToFahrenHeit];
}

- (IBAction)didTapFahrenheitToCelsius:(id)sender
{
    [self presentConversionViewControllerWithConversionType:ConversionTypeCelsiusToFahrenHeit];
}

- (void)presentConversionViewControllerWithConversionType:(ConversionType)type
{
    ConversionTableViewController *controller = [[ConversionTableViewController alloc] initWithConversionType:type];
    controller.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)conversionControllerDidExit:(ConversionTableViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
