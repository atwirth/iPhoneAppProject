//
//  BBallDateLocViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/25/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallDateLocViewController.h"
#import "BBallMasterViewController.h"

@interface BBallDateLocViewController ()

@end

@implementation BBallDateLocViewController

@synthesize datePicker;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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



- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
        if ([self.loc1 selectedSegmentIndex] == -1) {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Select Location"
                                                     message:@"You must select a locaton"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
            [av show];
            return NO;
        }
        else
        {
            return YES;
        }
    }
    


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toPlayers"])
        {
        
            BBallMasterViewController *masterViewController = [segue destinationViewController];
            masterViewController.players = self.players;
            switch ([self.loc1 selectedSegmentIndex]) {
                case 0: {
                    masterViewController.loc = @"Y";
                    break;
                }
                case 1: {
                    masterViewController.loc = @"N";
                    break;
                }
                case 2: {
                    masterViewController.loc = @"H";
                    break;
                }
                case 3: {
                    masterViewController.loc = @"O";
                    break;
                }            
            }
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setTimeStyle:NSDateFormatterNoStyle];
            NSString *result = [formatter stringFromDate:self.datePicker.date];
            masterViewController.date = result;
            
            
            
        }
   
}




- (IBAction)locChange:(id)sender {
    
    switch ([sender selectedSegmentIndex])
    {
        case 0:
        {
            [self.nextButton setEnabled:YES];
            break;
        }
        case 1:
        {
            [self.nextButton setEnabled:YES];
            break;
        }
        case 2:
        {
            [self.nextButton setEnabled:YES];
            break;
        }
        case 3:
        {
            [self.nextButton setEnabled:YES];
            break;
        }
    }
}
@end
