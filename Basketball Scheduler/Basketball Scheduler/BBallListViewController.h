//
//  BBallListViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/14/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "BBallDetailViewController.h"

@interface BBallListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) NSMutableArray *tempList;
@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) UIColor *orginalColor;

- (IBAction)allPlayers:(id)sender;
- (IBAction)inPlayers:(id)sender;
- (IBAction)outPlayers:(id)sender;
- (IBAction)lackPlayers:(id)sender;
- (void)changeToolbarColors;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *allButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *inButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *outButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *naButton;

@end
