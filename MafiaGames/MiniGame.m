//
//  MiniGame.m
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "MiniGame.h"

@interface MiniGame()
@property (nonatomic, assign) GameStatus gameStatus;
@end

@implementation MiniGame

- (instancetype)init {
    if (self = [super init]) {
        _gameStatus = GameStatusNew;
    }
    return self;
}

-(NSInteger)randomNumber{
    return arc4random()%10;
}

-(void)generateRandomNumber{
    self.randomNumber1 = self.randomNumber;
    self.randomNumber2 = self.randomNumber;
}

-(BOOL)evaluateProduct:(NSInteger)product{
    return (self.randomNumber1 * self.randomNumber2) == product;
}

- (GameStatus)currentStatus {
    return self.gameStatus;
}







@end
