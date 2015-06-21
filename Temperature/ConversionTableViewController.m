//
//  ConversionTableViewController.m
//  Temperature
//
//  Created by Matthew Fenwick on 6/19/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "ConversionTableViewController.h"
#import "ConversionTableViewCell.h"


typedef NS_ENUM(NSInteger, ConversionTableViewControllerConversionType)
{
    ConversionTableViewControllerConversionTypeFahrenheitToCelsius,
    ConversionTableViewControllerConversionTypeCelsiusToFahrenheit,
    ConversionTableViewControllerConversionTypePoundsToKilograms,
    ConversionTableViewControllerConversionTypeKilogramsToPounds
};


@interface ConversionTableViewController ()

@end


@implementation ConversionTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ConversionTableViewCell" bundle:nil] forCellReuseIdentifier:@"ConversionTableViewCell"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.title = [NSString stringWithFormat:@"%@", @(self.number)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)back
{
    [self.delegate conversionControllerDidExit:self];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4; // matches number of constants in ConversionTableViewCellConversionType
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConversionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConversionTableViewCell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[ConversionTableViewCell alloc] init];
    }
    cell.titleText = [NSString stringWithFormat:@"%@ %@ is: %@", @(self.number), [self text:indexPath.row], @((NSInteger)[self value:indexPath.row])];
    return cell;
}

#pragma mark - misc

- (NSString *)text:(NSInteger)row
{
    switch (row)
    {
        case ConversionTableViewControllerConversionTypeCelsiusToFahrenheit:
            return @"degrees Celsius in Fahrenheit";
        case ConversionTableViewControllerConversionTypeFahrenheitToCelsius:
            return @"degrees Fahrenheit in Celsius";
        case ConversionTableViewControllerConversionTypeKilogramsToPounds:
            return @"kilograms in pounds";
        case ConversionTableViewControllerConversionTypePoundsToKilograms:
            return @"pounds in kilograms";
        default:
            return @"";
    }
}

- (CGFloat)value:(NSInteger)row
{
    switch (row)
    {
        case ConversionTableViewControllerConversionTypeCelsiusToFahrenheit:
            return 1.8 * self.number + 32;
        case ConversionTableViewControllerConversionTypeFahrenheitToCelsius:
            return (self.number - 32) / 1.8;
        case ConversionTableViewControllerConversionTypeKilogramsToPounds:
            return self.number * 2.2;
        case ConversionTableViewControllerConversionTypePoundsToKilograms:
            return self.number / 2.2;
        default:
            return 0;
    }
}

@end
