//
//  PaymentTableViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 4/25/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "PaymentTableViewController.h"

@interface PaymentTableViewController ()

@end

@implementation PaymentTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameLabel.text = self.player.name;
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM/dd/YY"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    self.dateLabel.text = dateString;
    
    
    self.passwordField.secureTextEntry = YES;
    self.passwordField.clearsOnBeginEditing = NO;
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


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    self.password = self.passwordField.text;
    NSLog(@"amount length = %u", self.amountField.text.length);
    NSLog(@"message length = %u", self.messageField.text.length);
    NSLog(@"password length = %u", self.passwordField.text.length);
    if ([self.amountField.text  length] < 1) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Amount is Empty"
                                                     message:@"Enter correct amount"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
        
        
        return NO;
    }
    else if ([self.password length] < 1) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Password is empty"
                                                     message:@"Enter password"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
        [self.passwordField select:self.passwordField];
        return NO;
    }
    else if (![self.password isEqualToString:@"AndrewTravis"]) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Password is incorrect"
                                                     message:@"Enter correct password"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
        [self.passwordField select:self.passwordField];
        return NO;
    }
    else {
        return YES;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        [self enterPayment];
    }
}

- (void)enterPayment
{
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/enterpayment"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"paid_id="];
    [temp appendString:self.player.ID];
    [temp appendString:@"&paid_personname="];
    [temp appendString:self.player.name];
    [temp appendString:@"&paid_date="];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //NSString* string = [dateFormatter stringFromDate:self.dateLabel.text];
    NSString *result = self.dateLabel.text;
    
    [temp appendString:result];
    [temp appendString:@"&paid_amount="];
    [temp appendString:self.amountField.text];
    [temp appendString:@"&paid_message="];
    [temp appendString:self.messageField.text];
    [temp appendString:@"&specialkey="];
    [temp appendString:self.passwordField.text];
    [temp appendString:@""];
    
    
    //NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = ([[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}








@end
