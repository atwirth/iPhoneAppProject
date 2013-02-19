//
//  BBallWelcomeController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/18/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class People;

@interface BBallWelcomeController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate> 

@property (strong, nonatomic) NSMutableArray *players;
@property(nonatomic, readonly) NSInteger numberOfComponents;



@end
