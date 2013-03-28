//
//  BBallPaymentViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/26/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallPaymentViewController.h"

@interface BBallPaymentViewController () <UITextFieldDelegate>

@end

@implementation BBallPaymentViewController 

@synthesize datePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.nameLabel.text = self.player.name;
    self.idLabel.text = self.player.ID;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 1;
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"amount length = %u", self.amountField.text.length);
    NSLog(@"message length = %u", self.amountField.text.length);
    NSLog(@"password length = %u", self.amountField.text.length);
    if ([self.amountField.text  length] < 1) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Amount is Empty"
                                                     message:@"Enter correct amount"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
        
        
        return NO;
    }
    else if ([self.messageField.text length] < 1) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Message is Empty"
                                                     message:@"Enter month payment is for"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
        [self.messageField select:self.messageField];
        return NO;
    }
    else if ([self.passwordField.text length] < 1) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Password is empty"
                                                     message:@"Enter password"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [av show];
        [self.passwordField select:self.passwordField];
        return NO;
    }
    else if ([self.passwordField.text isEqual:@"AndrewTravis"]) {
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
    NSString *result = [formatter stringFromDate:self.datePicker.date];
        
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


@end
