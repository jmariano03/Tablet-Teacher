//
//  CreateWorksheetViewController.h
//  MathWidgetSample
//
//  Created by Rahman Siddique on 19/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.


#import <UIKit/UIKit.h>
#import "SPUserResizableView.h"
#import <AtkMaw/MAWMathWidget.h>



@interface CreateWorksheetViewController : UIViewController<UIGestureRecognizerDelegate,SPUserResizableViewDelegate,MAWMathViewControllerDelegate,UIAlertViewDelegate>
{
    SPUserResizableView *currentlyEditingView;
    SPUserResizableView *lastEditedView;
}

@property (strong, nonatomic) MAWMathViewController *myScriptViewController;
@property (strong, nonatomic) IBOutlet UIView *myScriptWritingView;
@property (nonatomic, strong) NSMutableDictionary *answerSquares;
@property (nonatomic, strong) NSMutableArray *answers;
@property (strong, nonatomic) IBOutlet UIView *holdWritingView;
@property (strong, nonatomic) IBOutlet UIButton *completeButton;



@end
