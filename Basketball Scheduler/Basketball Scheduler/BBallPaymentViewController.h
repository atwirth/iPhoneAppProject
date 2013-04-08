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
    NSURLConnection *connection;
    NSMutableData *xmlData;
}


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) NSString *password;
@property (weak, nonatomic) Person *player;





@end
