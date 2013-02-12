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
}

@property (nonatomic, weak) id parentParserDelegate;

@property (nonatomic) NSInteger *ID;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *cell;
@property (weak, nonatomic) NSString *home;
@property (weak, nonatomic) NSString *email;
@property (weak, nonatomic) NSString *active;
@property (weak, nonatomic) NSString *getTexts;
@property (weak, nonatomic) NSString *playingNext;

-(id)initWithID:(NSInteger *)ID name:(NSString *)name;
-(void)setCell:(NSString *)cell;
-(void)setHome:(NSString *)home;
-(void)setEmail:(NSString *)email;
-(void)setActive:(NSString *)active;
-(void)setGetTexts:(NSString *)getTexts;
-(void)setPlayingNext:(NSString *)playingNext;


@end
