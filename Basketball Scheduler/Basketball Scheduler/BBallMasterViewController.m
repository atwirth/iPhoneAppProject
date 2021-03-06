//
//  BBallMasterViewController.m
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallMasterViewController.h"
#import "BBallDetailViewController.h"
#import "BBallWelcomeController.h"
#import "Person.h"
#import "People.h"



@interface BBallMasterViewController ()

@end
@implementation BBallMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.played = [[NSMutableArray alloc] init];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.players.count;
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
    Person *item = [self.players objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item.name];
    
    if ([self.played containsObject:item]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
   
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.person = [self.players objectAtIndex:indexPath.row];
        [self.played addObject:self.person];
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.person = [self.players objectAtIndex:indexPath.row];
        [self.played removeObject:self.person];
    }
    NSString *temp = [[NSMutableString alloc] initWithFormat:@"%u Players", self.played.count];
    self.navigationItem.title = temp;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        if ([self.played count] != 0) {
            
            NSEnumerator *e = [self.played objectEnumerator];
            Person *object;
            while (object = [e nextObject])
            {
                [self enterPlayed:object];
            }
        }
    }
}

- (void)enterPlayed:(Person *)person {
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setplayed"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"play_id="];
    [temp appendString:person.ID];
    [temp appendString:@"&play_personname="];
    [temp appendString:person.name];
    [temp appendString:@"&play_date="];
    [temp appendString:self.date];
    [temp appendString:@"&play_westgym="];
    [temp appendString:self.loc];
    [temp appendString:@""];
    
    
    //NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
    
}


@end



