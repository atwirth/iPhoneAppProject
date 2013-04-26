//
//  BBallDateLocViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/25/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBallDateLocViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIDatePicker *datePicker;
}

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UISegmentedControl *loc1;

@property (strong, nonatomic) NSMutableArray *players;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

- (IBAction)locChange:(id)sender;


@end
