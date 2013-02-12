//
//  BBallDetailViewController.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/12/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface BirdsDetailViewController : UITableViewController

@property (strong, nonatomic) Person *player;
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *activeLabel;
@property (weak, nonatomic) IBOutlet UILabel *getTextsLabel;
@property (weak, nonatomic) IBOutlet UILabel *playingNextLabel;

@end
