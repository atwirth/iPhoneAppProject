//
//  People.h
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/12/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface People : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;

@property (nonatomic, readonly, strong) NSMutableArray *items;
-(Person *)objectAtIndex:(NSUInteger *)index;

@end