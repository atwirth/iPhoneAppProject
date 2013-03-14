//
//  AddPlayerViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 3/13/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPlayerViewController : UITableViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *cellInput;
@property (weak, nonatomic) IBOutlet UITextField *emailInput;
@property (weak, nonatomic) IBOutlet UITextField *homeInput;
@property (weak, nonatomic) IBOutlet UITextField *getTextsInput;

- (void)addPlayer;

@end
