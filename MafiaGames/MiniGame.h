//
//  MiniGame.h
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameStatus) {
    GameStatusNew,
    GameStatusInProgress,
    GameStatusOver,
};

@interface MiniGame : NSObject

@property (nonatomic, assign) NSInteger randomNumber1;
@property (nonatomic, assign) NSInteger randomNumber2;

-(void)generateRandomNumber;
-(BOOL)evaluateProduct:(NSInteger)product;

- (GameStatus)currentStatus;












@end
