//
//  ViewController.m
//  Temperature
//
//  Created by Matthew Fenwick on 5/25/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "TemperatureTableViewController.h"
#import "TemperatureTableViewCell.h"
#import "ConversionTableViewController.h"
#import "TemperatureNavigationController.h"


@interface TemperatureTableViewController () <ConversionTableViewControllerDelegate>

@property (nonatomic, strong) NSArray *numbers;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@end


@implementation TemperatureTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TemperatureTableViewCell" bundle:nil] forCellReuseIdentifier:@"TemperatureTableViewCell"];
    self.numbers = @[@(0), @(5), @(10), @(15), @(20), @(30), @(40), @(50), @(60), @(70), @(80), @(90), @(100), @(125), @(150), @(175), @(200), @(225), @(250), @(275), @(300), @(325), @(350), @(375), @(400), @(425), @(450)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.titleLabel.text = @"Choose a number";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.numbers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TemperatureTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TemperatureTableViewCell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[TemperatureTableViewCell alloc] init];
    }
    cell.number = self.numbers[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TemperatureTableViewCell *cell = (TemperatureTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    ConversionTableViewController *controller = [[ConversionTableViewController alloc] init];
    controller.delegate = self;
    controller.number = [cell.number integerValue];
    TemperatureNavigationController *navController = [[TemperatureNavigationController alloc] initWithRootViewController:controller];
    navController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - ConversionTableViewControllerDelegate

- (void)conversionControllerDidExit:(ConversionTableViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
