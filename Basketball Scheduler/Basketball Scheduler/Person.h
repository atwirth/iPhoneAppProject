//
//  Person.h
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentString;
    NSString *element;
}

@property (nonatomic, weak) id parentParserDelegate;

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *cell;
@property (nonatomic, retain) NSString *home;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *active;
@property (nonatomic, retain) NSString *getTexts;
@property (nonatomic, retain) NSString *playingNext;

//-(id)initWithID:(NSString *)ID name:(NSString *)name cell:(NSString *)cell home:(NSString *)home email:(NSString *)email active:(NSString *)active getTexts:(NSString *)getTexts playingNext:(NSString *)playingNext;



@end