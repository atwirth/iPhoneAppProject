//
//  BBallWelcomeController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/18/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallWelcomeController.h"
#import "BBallMasterViewController.h"
#import "BBallActionViewController.h"
#import "People.h"
#import "Person.h"

@interface BBallWelcomeController ()

@end

@implementation BBallWelcomeController



- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;    
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.players.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    NSString *name;
    Person *person = [self.players objectAtIndex:row];
    name = person.name;
    return name;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.person = [[Person alloc] init];
    self.person = [self.players objectAtIndex:row];
   self.nameLabel.text = self.person.name;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"actionButton"])
    {
        BBallActionViewController *actionViewController = [segue destinationViewController];
        
        
        actionViewController.person = self.person;
    }
}

-(IBAction)selectButton:(UIButton *)sender
{
    //[self prepareForSegue:<#(UIStoryboardSegue *)#> sender:<#(id)#>]
}








@end