//
//  Player.h
//  MagicLife1
//
//  Created by Robert Monahon on 1/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
{
    NSString *name;
    int life;
    int poison;
}

- (id)initWithName:(NSString *)playerName;
- (int)getLife;
- (int)getPoison;

- (void)setLife:(int)newLife;
- (void)setPoison:(int)newPoison;

@end
