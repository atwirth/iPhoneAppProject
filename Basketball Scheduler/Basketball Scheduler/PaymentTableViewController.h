//
//  PaymentTableViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 4/25/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PaymentTableViewController : UITableViewController
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
}


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) NSString *password;
@property (weak, nonatomic) Person *player;

@end
