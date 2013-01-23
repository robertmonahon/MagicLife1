//
//  ViewController.h
//  MagicLife1
//
//  Created by Robert Monahon on 1/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface ViewController : UIViewController
- (IBAction)Newgame:(id)sender;
- (IBAction)Player1:(id)sender;
- (IBAction)Player2:(id)sender;
- (IBAction)Player3:(id)sender;
- (IBAction)Player4:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Player1Out;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Player2Out;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Player3Out;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Player4Out;
- (IBAction)Life:(id)sender;
- (IBAction)Poison:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *Background;
- (void)click:(int)selectedSegment withPlayer:(Player *)ob withOutlet:(UISegmentedControl *)outlet;
- (void)displayHelper:(int)val withOutlet:(UISegmentedControl *)outlet;

@end
