//
//  BBallWelcomeController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/18/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallWelcomeController.h"
#import "BBallMasterViewController.h"
#import "BBallActionViewController.h"
#import "People.h"
#import "Person.h"

@interface BBallWelcomeController ()

@end


@implementation BBallWelcomeController

@synthesize namePicker;


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
        
        self.nameLabel.text = self.person.name;
        //[namePicker setUserInteractionEnabled:NO];
        
        
        
        
    }
}
    




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    self.person = [[people items] objectAtIndex:0];
    self.nameLabel.text = self.person.name;
    return 1;    
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    [self fetchID];
    return [[people items] count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    NSString *name;
    Person *person = [[people items] objectAtIndex:row];
    name = person.name;
    return name;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    self.person = [[people items] objectAtIndex:row];    
    self.nameLabel.text = self.person.name;

}

- (NSInteger)selectedRowInComponent:(NSInteger)component
{
    self.person = [[people items] objectAtIndex:0];
    self.nameLabel.text = self.person.name;
    return 0;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"actionButton"])
    {
        //NSLog(@"person name = %@", self.person.name);
        BBallActionViewController *actionViewController = [segue destinationViewController];
        
        
        actionViewController.person = self.person;
        //actionViewController.people = people;
        //NSMutableArray *tempArr = [[NSMutableArray alloc] initWithArray:[people items]];
        //actionViewController.players = tempArr;
    }
}

- (void)reloadList
{
    [[people items] removeAllObjects];
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
    [namePicker reloadAllComponents];
    
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

- (IBAction)doneWelcome:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        //AddPlayerViewController *addController = [segue sourceViewController];
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        [self fetchEntries];
        [self.namePicker reloadAllComponents];
    }
}

- (IBAction)cancelWelcome:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}





@end
