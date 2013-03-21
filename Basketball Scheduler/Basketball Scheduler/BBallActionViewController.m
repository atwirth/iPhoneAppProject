//
//  BBallActionViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/21/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallActionViewController.h"
#import "BBallMasterViewController.h"
#import "BBallWelcomeController.h"
#import "AddPlayerViewController.h"
#import "BBallListViewController.h"
#import "Person.h"
#import "People.h"

@interface BBallActionViewController ()
@end

@implementation BBallActionViewController



- (void)viewDidLoad
{
  [super viewDidLoad];
    self.navigationItem.title = self.person.name;
    [self fetchEntries];
    
    if ([self.person.playingNext isEqual:@"I"]) {
        [self.inoutSegmented setSelectedSegmentIndex:0];
    }
    if ([self.person.playingNext isEqual:@"O"]) {
        [self.inoutSegmented setSelectedSegmentIndex:1];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadList
{
    [[people items] removeAllObjects];
    [self fetchEntries];
}

- (void)reloadPlayer
{
    NSEnumerator *e = [[people items] objectEnumerator];
    Person *object;
    while (object = [e nextObject])
    {
        //NSLog(@"object.name = %@", object.name);
        if ([object.ID isEqual:self.person.ID]) {
            self.person = object;
            break;
        };
    }
}



- (void)fetchEntries
{
    xmlData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/getlist"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"%@ found a %@ element", self, elementName);
    if([elementName isEqual:@"people"]) {
        people = [[People alloc] init];
        [people setParentParserDelegate:self];
        [parser setDelegate:people];
        //NSLog(@"people count = %u", people.items.count);
        
        
    }
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [xmlData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    
    //NSString *xmlCheck = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    //NSLog(@"xmlCheck = %@", xmlCheck);
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    [parser setDelegate:self];
    [parser parse];
    xmlData = nil;
    connection = nil;
    
    self.players = [[NSMutableArray alloc] initWithArray:[people items]];
    //[namePicker reloadAllComponents];
    
    //NSLog(@"%@\n", people);
    
}


-(void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    connection = nil;
    xmlData = nil;
    NSString *errorString = [NSString stringWithFormat:@"Fetch faild: %@", [error localizedDescription]];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:errorString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}




- (void)setIn {

    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setinout"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&inout=I"];
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)setOut {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setinout"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&inout=O"];
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)setActive {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setactive"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&yesno=YES"];
    //NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)setInactive {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setactive"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&yesno=NO"];
    //NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}



- (IBAction)inoutAction:(id)sender {
    //UISegmentedControl *segment = (UISegmentedControl *)sender;
    switch ([sender selectedSegmentIndex])
    {
        case 0:
        {
            [self setIn];
            break;
        }
        case 1: 
        {
            [self setOut];
            break;
        }
    }
}



- (IBAction)activeButton:(id)sender {
    [self setActive];
    self.person.playingNext = @"Y";
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Update"
                                                 message:@"You are now Active"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
    
    
    [self reloadList];
    [self reloadPlayer];
}

- (IBAction)inactiveButton:(id)sender {
    [self setInactive];
    self.person.playingNext = @"N";
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Update"
                                                 message:@"You are now Inactive"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
    
    
    [self reloadList];
    [self reloadPlayer];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self reloadList];

    if ([[segue identifier] isEqualToString:@"test"])
    {
        
        BBallListViewController *listViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] initWithArray:self.players];
        listViewController.list = tempArr;
    }
    /*
    [self reloadList];
    //self.players = [people items];
    if ([[segue identifier] isEqualToString:@"playersList"])
    {
        BBallMasterViewController *masterViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] initWithArray:self.players];
        masterViewController.players = tempArr;
    }
    if ([[segue identifier] isEqualToString:@"inList"])
    {
        BBallMasterViewController *masterViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] init];
        NSEnumerator *e = [self.players objectEnumerator];
        Person *object;
        while (object = [e nextObject])
        {
            //NSLog(@"object.name = %@", object.name);
            if ([object.playingNext isEqual:@"I"]) {
                [tempArr addObject:object];
            };
        }
        masterViewController.players = tempArr;
    }
    if ([[segue identifier] isEqualToString:@"outList"])
    {
        BBallMasterViewController *masterViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] init];
        NSEnumerator *e = [self.players objectEnumerator];
        Person *object;
        while (object = [e nextObject])
        {
            //NSLog(@"object.name = %@", object.name);
            if ([object.playingNext isEqual:@"O"]) {
                [tempArr addObject:object];
            };
        }
        masterViewController.players = tempArr;
    }
    if ([[segue identifier] isEqualToString:@"notResponded"])
    {
        BBallMasterViewController *masterViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] init];
        NSEnumerator *e = [self.players objectEnumerator];
        Person *object;
        while (object = [e nextObject])
        {
            //NSLog(@"object.name = %@", object.name);
            if (object.playingNext == NULL) {
                [tempArr addObject:object];
            };
        }
        masterViewController.players = tempArr;
    }
    */
   
}


- (IBAction)done:(UIStoryboardSegue *)segue
{    
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        //AddPlayerViewController *addController = [segue sourceViewController];
               
        [self dismissViewControllerAnimated:YES completion:NULL];
        [self reloadList];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{    
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {        
        [self dismissViewControllerAnimated:YES completion:NULL];        
    }    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self reloadList];
}

@end


