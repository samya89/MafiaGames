//
//  MiniGameViewController.m
//  MafiaGames
//
//  Created by Samia Al Rahmani on 3/23/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "MiniGameViewController.h"
#import "MiniGame.h"

@interface MiniGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *randomNumber1Label;
@property (weak, nonatomic) IBOutlet UILabel *randomNumber2Label;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;


@end

@implementation MiniGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.answerTextField becomeFirstResponder];
    [self.miniGame generateRandomNumber];
    
    NSInteger randomNumber1 = self.miniGame.randomNumber1;
    NSInteger randomNumber2 = self.miniGame.randomNumber2;

    self.randomNumber1Label.text = [NSString stringWithFormat:@"%@",@(randomNumber1)];
    self.randomNumber2Label.text = [NSString stringWithFormat:@"%@",@(randomNumber2)];

    
    
                                    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)checkAnswer:(id)sender{
    NSInteger product = [self.answerTextField.text integerValue];
    BOOL correctAnswer = [self.miniGame evaluateProduct:product];
    
    if (correctAnswer) {
        [self.delegate miniGameDidWin];
    }else{
        [self.delegate miniGameDidLose];
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
