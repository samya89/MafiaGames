//
//  MiniGameViewController.h
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MiniGame;
@protocol MiniGameControllerDelegate <NSObject>

-(void)miniGameDidLose;
-(void)miniGameDidWin;

@end


@interface MiniGameViewController : UIViewController

@property (nonatomic, weak)id <MiniGameControllerDelegate>delegate;

@property (nonatomic) MiniGame *miniGame;


@end
