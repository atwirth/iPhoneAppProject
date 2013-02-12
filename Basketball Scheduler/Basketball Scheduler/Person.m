//
//  Person.m
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithID:(NSString *)ID name:(NSString *)name cell:(NSString *)cell home:(NSString *)home email:(NSString *)email active:(NSString *)active getTexts:(NSString *)getTexts playingNext:(NSString *)playingNext
{
    self = [super init];
    if (self) {
        _ID = ID;
        _name = name;
        _cell = cell;
        _home = home;
        _email = email;
        _active = active;
        _getTexts = getTexts;
        _playingNext = playingNext;
        return self;
    }
    return nil;

}

-(void)setCell:(NSString *)cell
{
    _cell = cell;
}

-(void)setHome:(NSString *)home
{
    _home = home;
}

-(void)setEmail:(NSString *)email
{
    _email = email;
}

-(void)setActive:(NSString *)active
{
    _active = active;
}

-(void)setGetTexts:(NSString *)getTexts
{
    _getTexts = getTexts;
}

-(void)setPlayingNext:(NSString *)playingNext
{
    _playingNext = playingNext;
}

@end
