//
//  MafiaViewController.m
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "MafiaViewController.h"
#import "MiniGameViewController.h"
#import "MiniGame.h"
#import "MafiaMiniGame.h"


@interface MafiaViewController ()<MiniGameControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mafiaStatusLabel;
@property (nonatomic) MafiaMiniGame *miniGame;


@end

@implementation MafiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.miniGame = [[MafiaMiniGame alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
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
    [self dismissViewControllerAnimated:YES completion:NULL];
//    [self.navigationController popViewControllerAnimated:YES];

}

- (void)miniGameDidWin{
    [self dismissViewControllerAnimated:YES completion:NULL];
    GameStatus status = [self.miniGame currentStatus];
    if (status == GameStatusOver){
        UIAlertController *winAlert = [UIAlertController alertControllerWithTitle:@"" message:@"YOU WON" preferredStyle:UIAlertControllerStyleAlert];
        [winAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self.navigationController popViewControllerAnimated:YES];
        }]];
        [self presentViewController:winAlert animated:YES completion:NULL];
    }else if (status == GameStatusInProgress){
        int villagerCount = self.miniGame.villager;
        self.mafiaStatusLabel.text = [NSString stringWithFormat:@"%d villagers left alive",villagerCount];
        
    }
}

    
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.



@end
