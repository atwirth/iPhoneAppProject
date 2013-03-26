//
//  BBallPaymentViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/26/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface BBallPaymentViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIDatePicker *datePicker;
}


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) Person *player;

- (IBAction)editDone:(id)sender;


@end
