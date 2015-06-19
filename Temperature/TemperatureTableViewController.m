//
//  ViewController.m
//  Temperature
//
//  Created by Matthew Fenwick on 5/25/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "TemperatureTableViewController.h"
#import "TemperatureTableViewCell.h"

@interface TemperatureTableViewController ()

@property (nonatomic, strong) NSArray *numbers;

@end


@implementation TemperatureTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TemperatureTableViewCell" bundle:nil] forCellReuseIdentifier:@"TemperatureTableViewCell"];
    self.numbers = @[@(0), @(5), @(10), @(15), @(20), @(30), @(40), @(50), @(60), @(70), @(80), @(90), @(100), @(125), @(150), @(175), @(200), @(225), @(250), @(275), @(300), @(325), @(350), @(375), @(400), @(425), @(450)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
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

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
