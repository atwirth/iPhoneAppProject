//
//  Person.m
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithID:(NSInteger *)ID name:(NSString *)name
{
    self = [super init];
    if (self) {
        _ID = ID;
        _name = name;
        return self;
    }
    return nil;

}

@end
