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
 
 */

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t\t%@ found a %@ element", self, elementName);
    element = elementName;
    //while (!currentString) {
    //[self parser:parser foundCharacters:currentString];
    //}
    /*
     if([elementName isEqual:@"id"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setID:currentString];
     }
     else if ([elementName isEqual:@"name"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setName:currentString];
     }
     else if ([elementName isEqual:@"cell"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setCell:currentString];
     }
     else if ([elementName isEqual:@"homephone"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setHome:currentString];
     }
     else if ([elementName isEqual:@"email"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setEmail:currentString];
     }
     else if ([elementName isEqual:@"active"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setActive:currentString];
     }
     else if ([elementName isEqual:@"gettexts"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setGetTexts:currentString];
     }
     else if ([elementName isEqual:@"playingnext"]) {
     //currentString = [[NSMutableString alloc] init];
     NSLog(@"currentString = %@", currentString);
     [self setPlayingNext:currentString];
     }
     */
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"element = %@", element);
    if (![string hasPrefix:@"\n"]) {
        NSLog(@"string = %@", string);
        //currentString = [[NSMutableString alloc] init];
        //[currentString appendString:string];
        
        
        
        if([element isEqual:@"id"]) {
            //currentString = [[NSMutableString alloc] init];
            [self setID:string];
        }
        else if ([element isEqual:@"name"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setName:string];
        }
        else if ([element isEqual:@"cell"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setCell:string];
        }
        else if ([element isEqual:@"homephone"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setHome:string];
        }
        else if ([element isEqual:@"email"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setEmail:string];
        }
        else if ([element isEqual:@"active"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setActive:string];
        }
        else if ([element isEqual:@"gettexts"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setGetTexts:string];
        }
        else if ([element isEqual:@"playingnext"]) {
            //currentString = [[NSMutableString alloc] init];
            //NSLog(@"currentString = %@", currentString);
            [self setPlayingNext:string];
        }
        
    }
    //NSLog(@"current = %@", selfcurrentString);
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
   
    currentString = nil;
    
    if ([elementName isEqual:@"person"])
        [parser setDelegate:parentParserDelegate];
}

@end