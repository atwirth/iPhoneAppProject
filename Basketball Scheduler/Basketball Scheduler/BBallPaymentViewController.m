//
//  BBallPaymentViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/26/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallPaymentViewController.h"

@interface BBallPaymentViewController ()

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



- (IBAction)editDone:(id)sender {
    [sender resignFirstResponder];
}
@end
