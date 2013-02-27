//
//  BBallMasterViewController.h
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class People;
@class Person;

@interface BBallMasterViewController : UITableViewController 
{
    //NSURLConnection *connection;
    //NSMutableData *xmlData;
    
    
}

@property (strong, nonatomic) NSMutableArray *players;
@property (strong, nonatomic) Person *person;
//- (void)fetchEntries;

@end