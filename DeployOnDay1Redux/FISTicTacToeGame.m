//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame


-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        [self resetBoard];
    }

    return self;
}

-(void)resetBoard
{
    NSMutableArray *rowOne = [[NSMutableArray alloc] initWithArray:@[@"", @"", @""]];
    NSMutableArray *rowTwo = [[NSMutableArray alloc] initWithArray:@[@"", @"", @""]];
    NSMutableArray *rowThree = [[NSMutableArray alloc] initWithArray:@[@"", @"", @""]];
    _board = [[NSMutableArray alloc] initWithArray:@[rowOne, rowTwo, rowThree]];
    
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    return self.board[row][column];
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self.board[row][column] isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[row][column] = @"X";
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[row][column] = @"O";
}

-(NSString *)winningPlayer
{
    NSUInteger xCount = 0;
    NSUInteger oCount = 0;
    
    // Checks rows for win
    for (NSUInteger row = 0; row < [self.board count]; row++) {
        for (NSUInteger column = 0; column < [self.board[row] count]; column++) {
            NSString *currentPiece = [self playerAtColumn:column row:row];
            if([currentPiece isEqualToString:@"X"]) {
                xCount++;
            }
            else if ([currentPiece isEqualToString:@"O"]) {
                oCount++;
            }
        }
        
        if (xCount == 3) {
            return @"X";
        }
        else if (oCount == 3) {
            return @"O";
        }
        xCount = 0;
        oCount = 0;
    }
    
    //Checks columns for win
    for (NSUInteger column = 0; column < [self.board count]; column++) {
        for (NSUInteger row = 0; row < [self.board count]; row++) {
            NSString *currentPiece = [self playerAtColumn:column row:row];
            if([currentPiece isEqualToString:@"X"]) {
                xCount++;
            }
            else if([currentPiece isEqualToString:@"O"]) {
                oCount++;
            }
        }
        
        if (xCount == 3) {
            return @"X";
        }
        else if (oCount == 3) {
            return @"O";
        }
        xCount = 0;
        oCount = 0;
    }
    
    //Checks diagonal wins
    NSString *topLeft = [self playerAtColumn:0 row:0];
    NSString *topRight = [self playerAtColumn:2 row:0];
    NSString *middle = [self playerAtColumn:1 row:1];
    NSString *bottomLeft = [self playerAtColumn:0 row:2];
    NSString *bottomRight = [self playerAtColumn:2 row:2];
    
    if ([topLeft isEqualToString:middle] && [middle isEqualToString:bottomRight]) {
        return topLeft;
    }
    else if ([topRight isEqualToString:middle] && [middle isEqualToString:bottomLeft]) {
        return topRight;
    }
    
    return @"";
}

-(BOOL)isADraw
{
    for (NSUInteger row = 0; row < [self.board count]; row++) {
        for (NSUInteger column = 0; column < [self.board count]; column++) {
            if ([[self playerAtColumn:column row:row] isEqualToString:@""]) { //checks if any spot is empty
                return NO;
            }
        }
    }
    return YES;
}

@end
