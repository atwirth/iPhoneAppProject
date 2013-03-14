//
//  AddPlayerViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/13/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "AddPlayerViewController.h"

@interface AddPlayerViewController () {
    NSURLConnection *connection;
    NSMutableData *xmlData;
}

@end

@implementation AddPlayerViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        if ([self.nameInput.text length]) {
            [self addPlayer];
        }
    }    
}

- (void)addPlayer {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.dwirth.com/westgym/wgservice.asmx/registernew"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    NSMutableString *temp = [[NSMutableString alloc] initWithString:@"personname="];
    [temp appendString:self.nameInput.text];
    [temp appendString:@"&personemail="];
    [temp appendString:self.emailInput.text];
    [temp appendString:@"&personcell="];
    [temp appendString:self.cellInput.text];
    [temp appendString:@"&personphone="];
    [temp appendString:self.homeInput.text];
    [temp appendString:@"&persongettexts="];
    [temp appendString:self.getTextsInput.text];
    [temp appendString:@""];
    

    //NSLog(@"temp = %@", temp);
    NSData *data = [temp dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}


@end
