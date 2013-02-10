//
//  BBallMasterViewController.h
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBallMasterViewController : UITableViewController
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
}
- (void)fetchEntries;

@end
