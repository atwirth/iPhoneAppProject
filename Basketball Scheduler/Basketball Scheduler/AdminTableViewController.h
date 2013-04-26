//
//  AdminTableViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 4/11/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminTableViewController : UITableViewController
{
    NSString *password;
}

@property (strong, nonatomic) NSMutableArray *players;
- (IBAction)createDepositButton:(id)sender;
- (void)createDeposit;

@end
