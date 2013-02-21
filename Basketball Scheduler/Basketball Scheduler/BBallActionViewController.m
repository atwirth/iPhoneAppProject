//
//  BBallActionViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/21/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallActionViewController.h"
#import "Person.h"

@interface BBallActionViewController ()
- (void)configureView;
@end

@implementation BBallActionViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameLabel.text = self.person.name;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Person *thePerson = self.person;
    
    if (thePerson) {
        
        self.nameLabel.text = thePerson.name;
    }
}



@end
