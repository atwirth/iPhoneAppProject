//
//  BBallListViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/14/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallListViewController.h"

@class Person;


@interface BBallListViewController () 

@end



@implementation BBallListViewController

@synthesize tableView = _tableView;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self){
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
    }
    return self;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tempList = [[NSMutableArray alloc] initWithArray:self.list];
    NSString *temp = [[NSMutableString alloc] initWithFormat:@"%u Players", self.tempList.count];
    self.navigationItem.title = temp;
    [self.allButton setTintColor:[UIColor blackColor]];
    self.orginalColor = self.inButton.tintColor;
    
    //self.tableView.dataSource = self.tempList;
	// Do any additional setup after looding the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.tempList.count;
    //return people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"playerCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Person *player = [people objectAtIndex:indexPath.row];
    //[[cell textLabel] setText:player.name];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Person *item = [self.tempList objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item.name];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPlayerDetails"])
    {
        BBallDetailViewController *detailViewController = [segue destinationViewController];
        
        Person *temp = [[Person alloc] init];
        temp = [self.tempList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
        detailViewController.player = [self.tempList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
    if ([[segue identifier] isEqualToString:@"payment"])
    {
        PaymentTableViewController *paymentViewController = [segue destinationViewController];
        
        Person *temp = [[Person alloc] init];
        temp = [self.tempList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
        paymentViewController.player = [self.tempList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
    
    
}

-(void)changeToolbarColors
{
    [self.allButton setTintColor:self.orginalColor];
    [self.inButton setTintColor:self.orginalColor];
    [self.outButton setTintColor:self.orginalColor];
    [self.naButton setTintColor:self.orginalColor];

}


- (IBAction)allPlayers:(id)sender {
    [self.tempList removeAllObjects];
    self.tempList = [[NSMutableArray alloc] init];
    NSEnumerator *e = [self.list objectEnumerator];
    Person *object;
    while (object = [e nextObject])
    {
        [self.tempList addObject:object];
    }
    [self.tableView reloadData];
    NSString *temp = [[NSMutableString alloc] initWithFormat:@"%u Players", self.tempList.count];
    self.navigationItem.title = temp;
    [self changeToolbarColors];
    [self.allButton setTintColor:[UIColor blackColor]];
}

- (IBAction)inPlayers:(id)sender {
    [self.tempList removeAllObjects];
    self.tempList = [[NSMutableArray alloc] init];
    NSEnumerator *e = [self.list objectEnumerator];
    Person *object;
    while (object = [e nextObject])
    {
        //NSLog(@"object.name = %@", object.name);
        if ([object.playingNext isEqual:@"I"]) {
            [self.tempList addObject:object];
        };
    }
    [self.tableView reloadData];
    NSString *temp = [[NSMutableString alloc] initWithFormat:@"%u Players", self.tempList.count];
    self.navigationItem.title = temp;
    [self changeToolbarColors];
    [self.inButton setTintColor:[UIColor blackColor]];

}

- (IBAction)outPlayers:(id)sender {
    [self.tempList removeAllObjects];
    self.tempList = [[NSMutableArray alloc] init];
    NSEnumerator *e = [self.list objectEnumerator];
    Person *object;
    while (object = [e nextObject])
    {
        //NSLog(@"object.name = %@", object.name);
        if ([object.playingNext isEqual:@"O"]) {
            [self.tempList addObject:object];
        };
    }
    [self.tableView reloadData];
    NSString *temp = [[NSMutableString alloc] initWithFormat:@"%u Players", self.tempList.count];
    self.navigationItem.title = temp;
    [self changeToolbarColors];
    [self.outButton setTintColor:[UIColor blackColor]];

}

- (IBAction)lackPlayers:(id)sender {
    [self.tempList removeAllObjects];
    self.tempList = [[NSMutableArray alloc] init];
    NSEnumerator *e = [self.list objectEnumerator];
    Person *object;
    while (object = [e nextObject])
    {
        //NSLog(@"object.name = %@", object.name);
        if (object.playingNext == NULL) {
            [self.tempList addObject:object];
        };
    }
    [self.tableView reloadData];
    NSString *temp = [[NSMutableString alloc] initWithFormat:@"%u Players", self.tempList.count];
    self.navigationItem.title = temp;
    [self changeToolbarColors];
    [self.naButton setTintColor:[UIColor blackColor]];

}

@end


