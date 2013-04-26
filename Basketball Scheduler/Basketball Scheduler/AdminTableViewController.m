//
//  AdminTableViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 4/11/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "AdminTableViewController.h"
#import "BBallListViewController.h"
#import "BBallDateLocViewController.h"

@interface AdminTableViewController (){
    NSURLConnection *connection;
    NSMutableData *xmlData;
}

@end

@implementation AdminTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)createDepositButton:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                     message:@"Password is needed!"
                                                    delegate:self
                                           cancelButtonTitle:@"Enter"
                                           otherButtonTitles:nil];
    
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView.title isEqualToString:@"Alert"]) {
        password = [[alertView textFieldAtIndex:0] text];
        if (![password isEqualToString:@"AndrewTravis"]) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Password"
                                                             message:@"No action will be taken!"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
            [alert show];
        }
        else {
            [self createDeposit];
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Correct!"
                                                             message:@"Deposit Created!"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void)createDeposit
{
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/createdeposit"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"specialkey="];
    [temp appendString:password];
    [temp appendString:@""];
    
    
    //NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
        
    if ([[segue identifier] isEqualToString:@"list"])
    {
        
        BBallListViewController *listViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] initWithArray:self.players];
        listViewController.list = tempArr;
    }
    else if ([[segue identifier] isEqualToString:@"enterPlayed"])
    {
        BBallDateLocViewController *dateViewController = [segue destinationViewController];
        
        
        NSMutableArray *tempArr = [[NSMutableArray alloc] initWithArray:self.players];
        dateViewController.players = tempArr;
    }
    
}

@end
