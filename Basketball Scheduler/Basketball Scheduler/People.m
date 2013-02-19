//
//  People.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/12/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "People.h"
#import "Person.h"


@implementation People
@synthesize items, parentParserDelegate;

-(id)init
{
    self = [super init];
    if (self) {
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"person"]) {
        Person *entry = [[Person alloc] init];
        [entry setParentParserDelegate:self];
        [parser setDelegate:entry];
        [items addObject:entry];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentString appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    currentString = nil;
    if ([elementName isEqual:@"people"])
        [parser setDelegate:parentParserDelegate];
}

-(Person *)objectAtIndex:(NSUInteger *)index {
    return [self.items objectAtIndex:*index];
}

@end