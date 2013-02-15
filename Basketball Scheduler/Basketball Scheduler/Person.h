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

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *cell;
@property (nonatomic, strong) NSString *home;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *active;
@property (nonatomic, strong) NSString *getTexts;
@property (nonatomic, strong) NSString *playingNext;

//-(id)initWithID:(NSString *)ID name:(NSString *)name cell:(NSString *)cell home:(NSString *)home email:(NSString *)email active:(NSString *)active getTexts:(NSString *)getTexts playingNext:(NSString *)playingNext;



@end