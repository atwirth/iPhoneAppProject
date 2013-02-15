//
//  BBallDetailViewController.m
//  Basketball Scheduler
//
//  Created by Andrew Wirth on 2/12/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "BBallDetailViewController.h"
#import "Person.h"


@interface BBallDetailViewController ()
- (void)configureView;
@end

@implementation BBallDetailViewController

#pragma mark - Managing the detail item


- (void)setPlayer:(Person *) newPlayer
{
    if (_player != newPlayer) {
        _player = newPlayer;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Person *thePlayer = self.player;
    
    if (thePlayer) {
        
        self.IDLabel.text = thePlayer.ID;
        self.nameLabel.text = thePlayer.name;
        self.cellLabel.text = thePlayer.cell;
        self.homeLabel.text = thePlayer.home;
        self.emailLabel.text = thePlayer.email;
        if ([thePlayer.active isEqual:@"Y"]) {
            self.activeLabel.text = @"Yes";
        }
        else {
            self.activeLabel.text = NULL;
        }
        if ([thePlayer.getTexts isEqual:@"Y"]) {
            self.getTextsLabel.text = @"Yes";
        }
        else {
            self.getTextsLabel.text = NULL;
        }
        if ([thePlayer.playingNext isEqual:@"I"]) {
            self.playingNextLabel.text = @"In";
        }
        else {
            self.playingNextLabel.text = NULL;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
