//
//  ConversionTableViewController.m
//  Temperature
//
//  Created by Matthew Fenwick on 5/25/15.
//  Copyright (c) 2015 Matthew Fenwick. All rights reserved.
//

#import "ConversionTableViewController.h"
#import "ConversionTableViewCell.h"

@interface ConversionTableViewController ()

@property (nonatomic) ConversionType conversionType;
@property (nonatomic, strong) NSArray *temperatures;

@end


@implementation ConversionTableViewController

- (instancetype)initWithConversionType:(ConversionType)type
{
    self = [self initWithNibName:@"ConversionTableViewController" bundle:nil];
    if (self)
    {
        _conversionType = type;
        NSMutableArray *temps = [NSMutableArray array];
        for (NSInteger i = -50; i < 500; i += 25)
        {
            [temps addObject:@(i)];
        }
        _temperatures = temps;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self.tableView registerClass:[ConversionTableViewCell class] forCellReuseIdentifier:@"ConversionTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ConversionTableViewCell" bundle:nil] forCellReuseIdentifier:@"ConversionTableViewCell"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.title = [ConversionTableViewController getTitleWithConversionType:self.conversionType];
}

+ (NSString *)getTitleWithConversionType:(ConversionType)type
{
    switch (type)
    {
        case ConversionTypeCelsiusToFahrenHeit:
            return @"Celsius to Fahrenheit";
        case ConversionTypeFahrenheitToCelsius:
            return @"Fahrenheit to Celsius";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - back

- (void)back
{
    [self.delegate conversionControllerDidExit:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.temperatures count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConversionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConversionTableViewCell" forIndexPath:indexPath];
    if (!cell)
    {
        NSLog(@"new one");
        cell = [[ConversionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ConversionTableViewCell"];
    }
    cell.titleLabel.text = @"Hi!";
    return cell;
}

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
