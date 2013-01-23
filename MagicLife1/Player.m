//
//  Player.m
//  MagicLife1
//
//  Created by Robert Monahon on 1/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)initWithName:(NSString *)playerName
{
    self = [super init];
    if(self){
        self->name = playerName;
        self->life = 20;
        self->poison = 0;
        
    }
    return self;
}

- (int)getLife{
    return self->life;
}

- (int)getPoison{
    return self->poison;
}

- (void)setLife:(int)newLife{
    self->life = newLife;
}

- (void)setPoison:(int)newPoison{
    self->poison = newPoison;
}

@end
