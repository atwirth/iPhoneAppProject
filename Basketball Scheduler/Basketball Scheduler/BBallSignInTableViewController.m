//
//  BBallSignInTableViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 4/28/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallSignInTableViewController.h"
#import "BBallActionViewController.h"
#import "People.h"
#import "Person.h"

@interface BBallSignInTableViewController ()

@end

@implementation BBallSignInTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    
    [self fetchEntries];
    
    
    [super viewDidLoad];    
    
}

- (void)fetchID
{
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:app];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    
    
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
        
        NSString *temp = [dict objectForKey:@"ID"];
        
        
        // Create a numerator
        NSEnumerator *e = [[people items] objectEnumerator];
        Person *object;
        while (object = [e nextObject])
        {
            //NSLog(@"object.name = %@", object.name);
            if ([object.ID isEqual:temp]) {
                self.person = object;
                break;
            };
        }
        
        self.person = object;
        //[namePicker setUserInteractionEnabled:NO];
        [self performSegueWithIdentifier:@"actionButton" sender:self];
        
        
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self fetchID];
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
    
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"actionButton"])
    {
        BBallActionViewController *actionViewController = [segue destinationViewController];
        
        if ([self.tableView indexPathForSelectedRow] != nil) {
            self.person  = [self.players objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        }
        
        actionViewController.person = self.person;
    }
}

- (void)reloadList
{
    [self.players removeAllObjects];
    [self fetchEntries];
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
    self.players = [people items];
    [self.tableView reloadData];
    
    
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

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    NSLog(@"Entering Background");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    NSString *temp = self.person.ID;
    [[NSDictionary dictionaryWithObject:temp forKey:@"ID"]writeToFile:plistPath atomically:YES];
    
}

- (IBAction)doneSignIn:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        //AddPlayerViewController *addController = [segue sourceViewController];
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        [self fetchEntries];
        [self.tableView reloadData];
    }
}

- (IBAction)cancelSignIn:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


@end
