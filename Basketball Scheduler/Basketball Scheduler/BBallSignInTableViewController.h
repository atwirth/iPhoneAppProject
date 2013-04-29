//
//  BBallSignInTableViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 4/28/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class People;
@class Person;

@interface BBallSignInTableViewController : UITableViewController <NSXMLParserDelegate>
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    People *people;
}

@property (strong, nonatomic) NSMutableArray *players;
@property (strong, nonatomic) Person *person;


- (void)fetchEntries;
- (void)fetchID;
- (void)reloadList;

- (IBAction)doneSignIn:(UIStoryboardSegue *)segue;
- (IBAction)cancelSignIn:(UIStoryboardSegue *)segue;
@end
