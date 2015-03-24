//
//  SheriffMiniGame.m
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "SheriffMiniGame.h"

@interface SheriffMiniGame()

@property (nonatomic, assign) GameStatus gameStatus;


@end

@implementation SheriffMiniGame

- (instancetype)init {
    if (self = [super init]) {
        _mafia = 4;
    }
    return self;
}

- (void)updateStatus{
    if (arc4random()%6 == 3) {
        self.gameStatus = GameStatusOver;
    } else {
        self.gameStatus = GameStatusInProgress;
    }
}

-(BOOL)evaluateProduct:(NSInteger)product{
    BOOL win = [super evaluateProduct:product];
    if (win) {
        [self updateStatus];
    }
    return win;
}


@end
