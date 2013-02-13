//
//  Person.m
//  Basketball Scheduler
//
//  Created by Maxwell Stanford on 2/10/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize ID, name, cell, home, email, active, getTexts, playingNext, parentParserDelegate;

/*
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

-(void)setCell:(NSString *)cell {
    _cell = cell;
}

-(void)setHome:(NSString *)home {
    _home = home;
}

-(void)setEmail:(NSString *)email {
    _email = email;
}

-(void)setActive:(NSString *)active {
    _active = active;
}

-(void)setGetTexts:(NSString *)getTexts {
    _getTexts = getTexts;
}

-(void)setPlayingNext:(NSString *)playingNext {
    _playingNext = playingNext;
}
 */

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t\t%@ found a %@ element", self, elementName);
    
    if([elementName isEqual:@"id"]) {        
        //currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString =  %@", self->currentString);
        self.ID = self->currentString;
    }
    else if ([elementName isEqual:@"name"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setName:currentString];
    }
    else if ([elementName isEqual:@"cell"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setCell:self->currentString];
    }
    else if ([elementName isEqual:@"homephone"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setHome:currentString];
    }
    else if ([elementName isEqual:@"email"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setEmail:currentString];
    }
    else if ([elementName isEqual:@"active"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setActive:currentString];
    }
    else if ([elementName isEqual:@"gettexts"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setGetTexts:currentString];
    }
    else if ([elementName isEqual:@"playingnext"]) {
        currentString = [[NSMutableString alloc] init];
        NSLog(@"currentString = %@", currentString);
        [self setPlayingNext:currentString];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"string = %@", string);
    if (![string hasPrefix:@"\n"]) {
        [self->currentString appendString:string];
        //NSLog(@"current = %@", selfcurrentString);
    }    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    currentString = nil;
    
    if ([elementName isEqual:@"person"])
        [parser setDelegate:parentParserDelegate];
}

@end
