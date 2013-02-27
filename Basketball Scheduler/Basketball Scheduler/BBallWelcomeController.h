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


@interface BBallWelcomeController : UITableViewController <NSXMLParserDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    
    People *people;
    
    UIPickerView  *namePicker;
    
}

- (void)fetchEntries;
- (void)fetchID;


//- (IBAction)signInButton:(id)sender;
@property (strong, nonatomic) Person *person;
//@property (strong, nonatomic) NSMutableArray *players;
@property (strong, nonatomic) IBOutlet UIPickerView *namePicker;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//- (IBAction)selectButton:(UIButton *)sender;



@end
