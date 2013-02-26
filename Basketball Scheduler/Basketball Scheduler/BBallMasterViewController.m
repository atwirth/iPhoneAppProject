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
    
    
    
    
    [self fetchEntries];
    //[self setIdentification:self.identification];
    /*
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
        NSLog(@"plist text = %@", dict);
        Person *temp = [[Person alloc] init];
        for (NSUInteger n = 0; n < people.items.count; n++) {
            temp = [people objectAtIndex:&n];
            NSLog(@"person name = %@", temp.name);
        }
        
        
    }
    
    
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(fetchEntries)];
     self.navigationItem.rightBarButtonItem = addButton;
     People *first = [[Person alloc] initWithID:@"Boss" name:@"Andrew" cell:@"319-215-6308" home:@"319-266-1270" email:@"atwirth@coe.edu" active:@"no" getTexts:@"no" playingNext:@"no"];
     people = [[NSMutableArray alloc] initWithObjects:first, nil];
     */
}
/*
- (void)setIdentification:(Person *)identification
{
    
    _identification = [[Person alloc] init];
    _identification = [people.items objectAtIndex:0];
    
}
*/
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
    
    return [[people items] count];
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
    Person *item = [[people items] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item.name];
   
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
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
/*
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 [_objects removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPlayerDetails"])
    {
        BBallDetailViewController *detailViewController = [segue destinationViewController];
        
        
        detailViewController.player = [[people items] objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
    
    if ([[segue identifier] isEqualToString:@"signIn"])
    {
        BBallWelcomeController *welcomeViewController = [segue destinationViewController];
        welcomeViewController.players = [people items];
    }
    
}

- (void)fetchEntries
{
    xmlData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/getlist"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
        connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
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
    [[self tableView] reloadData];
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
/*
- (void)applicationDidEnterBackground:(NSNotification *)notification {
    NSLog(@"Entering Background");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    //NSLog(@"identification name = %@", self.identification.name);
    
    [[NSDictionary dictionaryWithObjectsAndKeys:self.identification.name, @"text", nil] writeToFile:plistPath atomically:YES];
}
*/

@end



