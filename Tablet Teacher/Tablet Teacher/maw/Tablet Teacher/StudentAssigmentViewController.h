//
//  StudentAssigmentViewController.h
//  Tablet Teacher
//
//  Created by Rahman Siddique on 23/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AtkMaw/MAWMathWidget.h>
#import "StudentAnswerBoxView.h"

@interface StudentAssigmentViewController : UIViewController<MAWMathViewControllerDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *toolBarView;
@property (strong, nonatomic) MAWMathViewController *myScriptWritingViewController;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *firstAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *secondAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *ThirdAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *fourthAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *fifthAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *sixthAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *seventhAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *EigthAnswerBox;
@property (strong, nonatomic) IBOutlet StudentAnswerBoxView *writingView;
@property (strong, nonatomic) IBOutlet UIButton *drawButton;
@property (strong, nonatomic) IBOutlet UIButton *eraseButton;
@property (strong, nonatomic) IBOutlet UIButton *answerButton;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@end
