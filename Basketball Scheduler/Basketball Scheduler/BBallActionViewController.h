//
//  BBallActionViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/21/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@class People;

@interface BBallActionViewController : UITableViewController{
    NSURLConnection *connection;
}

@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) NSMutableArray *players;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)inButton:(id)sender;
- (IBAction)outButton:(id)sender;
- (IBAction)activeButton:(id)sender;
- (IBAction)inactiveButton:(id)sender;

@end
