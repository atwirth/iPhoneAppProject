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
   


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toPlayers"])
        {
        
            BBallMasterViewController *masterViewController = [segue destinationViewController];
            masterViewController.players = self.players;
            if ([self.loc1 selectedSegmentIndex] != -1){
                switch ([self.loc1 selectedSegmentIndex]) {
                    case 0: {
                        masterViewController.loc = @"Y";
                        break;
                    }
                    case 1: {
                        masterViewController.loc = @"N";
                        break;
                    }
                }
            }
            else {
                switch ([self.loc2 selectedSegmentIndex]) {
                    case 0: {
                        masterViewController.loc = @"H";
                        break;
                    }
                    case 1: {
                        masterViewController.loc = @"O";
                        break;
                    }
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




- (IBAction)loc1Change:(id)sender {
    
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
    }
    self.loc2.selectedSegmentIndex = -1;
}

- (IBAction)loc2Change:(id)sender {
    
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
    }
    self.loc1.selectedSegmentIndex = -1;
}
@end
