//
//  ViewController.m
//  MagicLife1
//
//  Created by Robert Monahon on 1/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int lifeOrPoison;
    Player *Player1Ob;
    Player *Player2Ob;
    Player *Player3Ob;
    Player *Player4Ob;
    NSMutableArray *PlayerObjects;
    NSMutableArray *PlayerOutputs;
    int objectCount;
}

@end

@implementation ViewController
@synthesize Background;
@synthesize Player1Out;
@synthesize Player2Out;
@synthesize Player3Out;
@synthesize Player4Out;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Player1Ob = [[Player alloc] initWithName:@"Player1"];
    Player2Ob = [[Player alloc] initWithName:@"Player2"];
    Player3Ob = [[Player alloc] initWithName:@"Player3"];
    Player4Ob = [[Player alloc] initWithName:@"Player4"];
    
    PlayerObjects = [NSMutableArray arrayWithObjects:Player1Ob, Player2Ob, Player3Ob, Player4Ob, nil];
    
    PlayerOutputs = [NSMutableArray arrayWithObjects:Player1Out, Player2Out, Player3Out, Player4Out, nil];
    
    objectCount = 4;
}

- (void)viewDidUnload
{
    [self setPlayer1Out:nil];
    [self setPlayer2Out:nil];
    [self setPlayer3Out:nil];
    [self setPlayer4Out:nil];
    [self setBackground:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)Newgame:(id)sender {
    
    for (int i = 0; i < objectCount; i++){
        [[PlayerObjects objectAtIndex:i] setLife:20];
        [[PlayerObjects objectAtIndex:i] setPoison:0];
        [self displayHelper:[[PlayerObjects objectAtIndex:i] getLife] withOutlet:[PlayerOutputs objectAtIndex:i]];
    }


    Background.backgroundColor = [UIColor whiteColor];
    
    lifeOrPoison = 0;
}

- (IBAction)Player1:(UISegmentedControl *)sender {
    int sideClicked = sender.selectedSegmentIndex;
    [self click:sideClicked withPlayer:Player1Ob withOutlet:Player1Out];
}

- (IBAction)Player2:(UISegmentedControl *)sender {
    int sideClicked = sender.selectedSegmentIndex;
    [self click:sideClicked withPlayer:Player2Ob withOutlet:Player2Out];
}

- (IBAction)Player3:(UISegmentedControl *)sender {
    int sideClicked = sender.selectedSegmentIndex;
    [self click:sideClicked withPlayer:Player3Ob withOutlet:Player3Out];
}

- (IBAction)Player4:(UISegmentedControl *)sender {
    int sideClicked = sender.selectedSegmentIndex;
    [self click:sideClicked withPlayer:Player4Ob withOutlet:Player4Out];}


- (IBAction)Life:(id)sender {
    for (int i = 0; i < objectCount; i++) {
        [self displayHelper:[[PlayerObjects objectAtIndex:i] getLife] withOutlet:[PlayerOutputs objectAtIndex:i]];
    }
    
    Background.backgroundColor = [UIColor whiteColor];
    
    lifeOrPoison = 0;
}

- (IBAction)Poison:(id)sender {
    for (int i = 0; i < objectCount; i++) {
        [self displayHelper:[[PlayerObjects objectAtIndex:i] getPoison] withOutlet:[PlayerOutputs objectAtIndex:i]];
    }
    
    Background.backgroundColor = [UIColor greenColor];
    
    lifeOrPoison = 1;
}

- (void)displayHelper:(int)val withOutlet:(UISegmentedControl *)outlet{
    [outlet setTitle:[NSString stringWithFormat:@"%d", val/10] forSegmentAtIndex:0];
    [outlet setTitle:[NSString stringWithFormat:@"%d", val%10] forSegmentAtIndex:1];
}

- (void)click:(int)selectedSegment withPlayer:(Player *)ob withOutlet:(UISegmentedControl *)outlet{
    int value;
    
    if(lifeOrPoison == 0){
        if(selectedSegment == 0) {
            [ob setLife:[ob getLife]-1];
        } else {
            [ob setLife:[ob getLife]+1];
        }
        value = [ob getLife];
    } else {
        if(selectedSegment == 0) {
            [ob setPoison:[ob getPoison]-1];
        } else {
            [ob setPoison:[ob getPoison]+1];
        }
        value = [ob getPoison];
    }
    

    [outlet setTitle:[NSString stringWithFormat:@"%d", value/10] forSegmentAtIndex:0];
    [outlet setTitle:[NSString stringWithFormat:@"%d", value%10] forSegmentAtIndex:1];
}

@end
