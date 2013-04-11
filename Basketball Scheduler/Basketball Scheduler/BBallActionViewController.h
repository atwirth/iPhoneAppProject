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

@interface BBallActionViewController : UITableViewController <NSXMLParserDelegate>{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    
    People *people;
}

//@property (strong, nonatomic) People *people;
@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) NSMutableArray *players;
@property (weak, nonatomic) IBOutlet UISegmentedControl *inoutSegmented;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activeSegmented;
@property (weak, nonatomic) IBOutlet UITableViewCell *adminCell;

- (IBAction)inoutAction:(id)sender;
- (IBAction)activeAction:(id)sender;


- (void)fetchEntries;
- (void)reloadList;
- (void)reloadPlayer;
/*
- (IBAction)inButton:(id)sender;
- (IBAction)outButton:(id)sender;
- (IBAction)activeButton:(id)sender;
- (IBAction)inactiveButton:(id)sender;
*/
- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
