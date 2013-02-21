//
//  BBallWelcomeController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/18/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class People;
@class Person;

@interface BBallWelcomeController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
     UIPickerView  *namePicker;
}

@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) IBOutlet UIPickerView *namePicker;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) NSMutableArray *players;
- (IBAction)selectButton:(UIButton *)sender;



@end
