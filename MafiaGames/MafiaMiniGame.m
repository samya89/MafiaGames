//
//  MafiaMiniGame.m
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "MafiaMiniGame.h"

@interface MafiaMiniGame()

@property (nonatomic, assign) GameStatus gameStatus;
@property (nonatomic, assign, readwrite) int villager;

@end

@implementation MafiaMiniGame

- (instancetype)init {
    if (self = [super init]) {
        _villager = 4;
    }
    return self;
}

- (int)killVillager{
    --self.villager;
    if (self.villager <= 0) {
        self.gameStatus = GameStatusOver;
    } else {
        self.gameStatus = GameStatusInProgress;
    }
    return self.villager;
}

-(BOOL)evaluateProduct:(NSInteger)product{
    BOOL win = [super evaluateProduct:product];
    if (win) {
        [self killVillager];
    }
    return win;
}



@end
