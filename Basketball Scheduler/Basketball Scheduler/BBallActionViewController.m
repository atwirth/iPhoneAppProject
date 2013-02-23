//
//  BBallActionViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/21/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallActionViewController.h"
#import "BBallMasterViewController.h"
#import "Person.h"

@interface BBallActionViewController ()
@end

@implementation BBallActionViewController



- (void)viewDidLoad
{
  [super viewDidLoad];
    self.nameLabel.text = self.person.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doneAction:(UIStoryboardSegue *)segue
{
    
}


- (void)setIn {

    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setinout"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&inout=I"];
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)setOut {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setinout"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&inout=O"];
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)setActive {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setactive"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&yesno=YES"];
    NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)setInactive {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setactive"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"id="];
    [temp appendString:self.person.ID];
    [temp appendString:@"&yesno=NO"];
    NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}


- (IBAction)inButton:(id)sender {
    [self setIn];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Update"
                                                 message:@"You are now IN for next event!"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

- (IBAction)outButton:(id)sender {
    [self setOut];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Update"
                                                 message:@"You are now OUT for next event!"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

- (IBAction)activeButton:(id)sender {
    [self setActive];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Update"
                                                 message:@"You are now Active"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

- (IBAction)inactiveButton:(id)sender {
    [self setInactive];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Update"
                                                 message:@"You are now Inactive"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPlayerDetails"])
    {
        BBallMasterViewController *masterViewController = [segue destinationViewController];
        
        masterViewController.identification = self.person;
    }
    
}

@end


