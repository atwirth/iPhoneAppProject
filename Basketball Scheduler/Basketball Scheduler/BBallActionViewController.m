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
    NSLog(@"Person name = %@", self.person.name);
    self.nameLabel.text = self.person.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setInOut
{
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/setinout"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setValue:self.person.ID forHTTPHeaderField:@"id"];
    [req setValue:@"O" forHTTPHeaderField:@"inout"];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}


- (IBAction)inoutButton:(id)sender {
    [self setInOut];
}
@end


