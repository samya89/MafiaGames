//
//  SheriffViewController.m
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "SheriffViewController.h"
#import "MiniGameViewController.h"
#import "SheriffMiniGame.h"


@interface SheriffViewController ()<MiniGameControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *sheriffStatusLabel;
@property (nonatomic) SheriffMiniGame *miniGame;


@end

@implementation SheriffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.miniGame = [[SheriffMiniGame alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destinationController = [segue destinationViewController];
    if ([destinationController isKindOfClass:[MiniGameViewController class]]){
        MiniGameViewController *miniGameViewController = (MiniGameViewController *)destinationController;
        miniGameViewController.delegate = self;
        miniGameViewController.miniGame = self.miniGame;
    }
}


#pragma mark - MiniGameControllerDelegate

- (void)miniGameDidLose{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)miniGameDidWin{
    [self.navigationController popViewControllerAnimated:YES];
    GameStatus status = [self.miniGame currentStatus];
    if (status == GameStatusOver){
        UIAlertController *winAlert = [UIAlertController alertControllerWithTitle:@"" message:@"YOU WON" preferredStyle:UIAlertControllerStyleAlert];
        [winAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
        }]];
        [self presentViewController:winAlert animated:YES completion:NULL];
    }else if (status == GameStatusInProgress){
        int mafiaCount = self.miniGame.mafia;
        self.sheriffStatusLabel.text = [NSString stringWithFormat:@"%d mafia members are at large!",mafiaCount];
    }
}



@end
