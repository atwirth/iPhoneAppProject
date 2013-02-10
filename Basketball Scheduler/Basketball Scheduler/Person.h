//
//  Person.h
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSInteger *id;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *cell;
@property (weak, nonatomic) NSString *home;
@property (weak, nonatomic) NSString *email;
@property (weak, nonatomic) NSString *active;
@property (weak, nonatomic) NSString *getTexts;
@property (weak, nonatomic) NSString *playingNext;



@end
