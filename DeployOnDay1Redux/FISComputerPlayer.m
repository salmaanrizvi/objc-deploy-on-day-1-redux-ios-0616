//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled
{
    return YES;
}

-(FISTicTacToePosition)nextPlay
{
    NSUInteger upperRandomLimit = 3;
    NSUInteger randomRow = arc4random_uniform(upperRandomLimit);
    NSUInteger randomCol = arc4random_uniform(upperRandomLimit);
    
    while(![self.game canPlayAtColumn:randomCol row:randomRow]) {
        randomRow = arc4random_uniform(upperRandomLimit);
        randomCol = arc4random_uniform(upperRandomLimit);
    }
    NSLog(@"Computer playing piece %@", self.symbol);
    return FISTicTacToePositionMake(randomCol, randomRow);
}

@end
