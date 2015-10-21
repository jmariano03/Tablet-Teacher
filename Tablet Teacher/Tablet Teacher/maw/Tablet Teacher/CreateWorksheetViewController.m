//
//  CreateWorksheetViewController.m
//  MathWidgetSample
//
//  Created by Rahman Siddique on 19/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import "CreateWorksheetViewController.h"
#import "MyCertificate.h"

@interface CreateWorksheetViewController ()
{
    UILabel *fromLabel;
    BOOL isUserDraggingAnswerBox;
    BOOL isUserEnteringAnswerOnMyScript;
    UIButton *clearButton;
    UIButton *addButton;
    int indexOfView;
    int QuestionNumber;
    double QuestionAnswer;
    NSString *userExpression;
}
@end


@implementation CreateWorksheetViewController

- (void)viewDidLoad {

    self.myScriptViewController =[[MAWMathViewController alloc] init];
    self.myScriptViewController.delegate = self;
    self.myScriptViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.myScriptWritingView addSubview:self.myScriptViewController.view];
    NSLog(@"%@",NSStringFromCGRect(self.myScriptViewController.view.frame));
    [self configure];

    [self addChildViewController:self.myScriptViewController];
    self.myScriptViewController.view.frame = CGRectMake(0, 0, self.myScriptWritingView.frame.size.width, self.myScriptWritingView.frame.size.height);
    [self.myScriptWritingView addSubview:self.myScriptViewController.view];
    [self.myScriptViewController didMoveToParentViewController:self];

    self.answerSquares = [NSMutableDictionary dictionary];
    
    indexOfView= 0;

    
//    // (2) Create a second resizable view with a UIImageView as the content.
//    CGRect imageFrame = CGRectMake(50, 200, 140, 70);
//    SPUserResizableView *imageResizableView = [[SPUserResizableView alloc] initWithFrame:imageFrame];
//    UIView *contenttView = [[UIView alloc] initWithFrame:gripFrame];
//    [contenttView setBackgroundColor:[UIColor lightGrayColor]];
//    imageResizableView.contentView = contenttView;
//    imageResizableView.delegate = self;
//    [self.view addSubview:imageResizableView];
    

 
    isUserDraggingAnswerBox = YES;
    isUserEnteringAnswerOnMyScript = NO;

    // Create a Button to get Help
    clearButton =  [UIButton buttonWithType:UIButtonTypeInfoDark ];
    CGRect buttonRect = clearButton.frame;
    
    // CALCulate the bottom right corner
    buttonRect.origin.x = self.view.frame.size.width - buttonRect.size.width - 8;
    buttonRect.origin.y = buttonRect.size.height - 8;
    [clearButton setFrame:buttonRect];
    
    [clearButton addTarget:self.myScriptViewController action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [self.myScriptWritingView addSubview:clearButton];
    
    
    // Create a Button to get Help
    addButton =  [UIButton buttonWithType:UIButtonTypeContactAdd];
    CGRect addButtonRext = addButton.frame;
    // CALCulate the bottom right corner
    addButtonRext.origin.x = self.view.frame.size.width - addButtonRext.size.width - 8;
    addButtonRext.origin.y = self.myScriptWritingView.frame.size.height-addButtonRext.size.height - 20;
    [addButton setFrame:addButtonRext];
    
    [addButton addTarget:self action:@selector(AddQuestion) forControlEvents:UIControlEventTouchUpInside];
    [self.myScriptWritingView addSubview:addButton];

}

-(void)viewDidLayoutSubviews
{
    
}

-(void)showMyScriptWritingView
{
    self.holdWritingView.hidden = YES;
    [self setLabelInMyScriptView];
}

-(void) setLabelInMyScriptView
{
    fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,600, 200)];
    
    
    fromLabel.text = @"Write Question Number Here";
    [fromLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:36]];
    //    fromLabel.font = customFont;
    //    fromLabel.numberOfLines = 1;
    //    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    //    fromLabel.adjustsFontSizeToFitWidth = YES;
    //    fromLabel.adjustsLetterSpacingToFitWidth = YES;
    //    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    //    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = [UIColor whiteColor];
    fromLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.myScriptWritingView addSubview:fromLabel];
    
    fromLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:fromLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.myScriptWritingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.myScriptWritingView addConstraint:xCenterConstraint];
    
    NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:fromLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.myScriptWritingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.myScriptWritingView addConstraint:yCenterConstraint];
    
    
    [self.myScriptWritingView layoutIfNeeded];
    [self.view layoutIfNeeded];
    
}
- (IBAction)insertZoneBtnPressed:(id)sender {
    // (1) Create a user resizable view with a simple red background content view.
    
   
    isUserEnteringAnswerOnMyScript = NO;
    
    CGRect gripFrame = CGRectMake(50, 50, 140, 70);
    SPUserResizableView *userResizableView = [[SPUserResizableView alloc] initWithFrame:gripFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:gripFrame];
    [contentView setBackgroundColor:[UIColor lightGrayColor]];
    userResizableView.contentView = contentView;
    userResizableView.delegate = self;
    [userResizableView showEditingHandles];
    currentlyEditingView = userResizableView;
    lastEditedView = userResizableView;
    
    [lastEditedView hideEditingHandles];
    [self.answerSquares setObject:contentView forKey:[NSString stringWithFormat:@"%d",indexOfView]];
    indexOfView++;
    [self.view addSubview:userResizableView];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideEditingHandles)];
    [gestureRecognizer setDelegate:self];
    [currentlyEditingView addGestureRecognizer:gestureRecognizer];
    
}

- (void)userResizableViewDidBeginEditing:(SPUserResizableView *)userResizableView {
    [currentlyEditingView hideEditingHandles];
    currentlyEditingView = userResizableView;
    
    isUserDraggingAnswerBox = YES;
    
}

- (void)userResizableViewDidEndEditing:(SPUserResizableView *)userResizableView {
    lastEditedView = userResizableView;
    isUserDraggingAnswerBox = NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if(isUserDraggingAnswerBox ==NO)
    {
        [self showMyScriptWritingView];
    }
    if ([currentlyEditingView hitTest:[touch locationInView:currentlyEditingView] withEvent:nil]) {
        return NO;
    }
    return YES;
}

-(void)AddQuestion
{
    userExpression = [self.myScriptViewController resultAsText];
    if (isUserEnteringAnswerOnMyScript == NO)
    {
        if (userExpression && userExpression.length > 0)
        {
            NSInteger tempInteger = [userExpression integerValue];
            if (tempInteger == 0 )
            {
                NSLog(@"No integer identified");
                [clearButton sendActionsForControlEvents: UIControlEventTouchUpInside];
            }
            else
            {
                QuestionNumber = [userExpression integerValue];
                isUserEnteringAnswerOnMyScript = YES;
                [clearButton sendActionsForControlEvents: UIControlEventTouchUpInside];
                fromLabel.text = @"Write Answer Now";
                fromLabel.hidden = NO;
            }
        }
    }
    else if(isUserEnteringAnswerOnMyScript)
        {
            if (userExpression && userExpression.length >0)
            {
                NSInteger tempInteger = [userExpression integerValue];
                if (tempInteger == 0 )
                {
                    NSLog(@"No integer identified");
                    [clearButton sendActionsForControlEvents: UIControlEventTouchUpInside];
                }
                else
                {
                    QuestionAnswer = [userExpression integerValue];
                    isUserEnteringAnswerOnMyScript = NO;
                     UILabel*  QuestionAnswerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,0,currentlyEditingView.frame.size.width-10, currentlyEditingView.frame.size.height)];
                    QuestionAnswerLabel.text = [NSString stringWithFormat:@"%d. %.f",QuestionNumber,QuestionAnswer];
                    [currentlyEditingView addSubview:QuestionAnswerLabel];
                    [clearButton sendActionsForControlEvents: UIControlEventTouchUpInside];
                    fromLabel.text = @"Write Question Number Here";
                    fromLabel.hidden = NO;
                }
            }
        }
}

- (void)hideEditingHandles {
    // We only want the gesture recognizer to end the editing session on the last
    // edited view. We wouldn't want to dismiss an editing session in progress.
    [lastEditedView hideEditingHandles];
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)configure
{
    // Recognition resources
    NSArray *resources   = @[@"math-ak.res", @"math-grm-maw.res"];
    
    // Certificate
    NSData  *certificate = [NSData dataWithBytes:myCertificate.bytes length:myCertificate.length];
    
    [_myScriptViewController configureWithResources:resources
                                    certificate:certificate];
}

#pragma mark - Math Widget Delegate - Configuration

- (void)mathViewControllerDidBeginConfiguration:(MAWMathViewController *)mathViewController
{
    NSLog(@"Equation configuration begin");
}

- (void)mathViewControllerDidEndConfiguration:(MAWMathViewController *)mathViewController
{
    NSLog(@"Equation configuration succeeded");
}

- (void)mathViewController:(MAWMathViewController *)mathViewController didFailConfigurationWithError:(NSError *)error
{
    NSLog(@"Equation configuration failed (%@)", [error localizedDescription]);
}

#pragma mark - Math Widget Delegate - Recognition

- (void)mathViewControllerDidBeginRecognition:(MAWMathViewController *)mathViewController
{
    NSLog(@"Equation recognition begin");
}

- (void)mathViewControllerDidEndRecognition:(MAWMathViewController *)mathViewController
{
    NSLog(@"Equation recognition end");
}

#pragma mark - Math Widget Delegate - Solving

- (void)mathViewController:(MAWMathViewController *)mathViewController didChangeUsingAngleUnit:(BOOL)used
{
    if (used)
    {
        NSLog(@"Angle unit is used");
    }
    else
    {
        NSLog(@"Angle unit is not used");
    }
}

#pragma mark - Math Widget Delegate - Gesture

- (void)mathViewController:(MAWMathViewController *)mathViewController didPerformEraseGesture:(BOOL)partial
{
    NSString *gestureState = partial ? @"partial" : @"complete";
    
    NSLog(@"Erase gesture handled by current equation (%@)", gestureState);
}

#pragma mark - Math Widget Delegate - Undo Redo

- (void)mathViewControllerDidChangeUndoRedoState:(MAWMathViewController *)mathViewController
{
    NSLog(@"Undo Redo state changed");
}

#pragma mark - Math Widget Delegate - Writing

- (void)mathViewControllerDidBeginWriting:(MAWMathViewController *)mathViewController
{
    NSLog(@"Start writing");
    fromLabel.hidden = YES;
    [self.myScriptWritingView layoutIfNeeded];
}

- (void)mathViewControllerDidEndWriting:(MAWMathViewController *)mathViewController
{
    NSLog(@"End writing");
    
    NSString * result = [mathViewController resultAsText];
    NSLog(@"result of equation %@",result);
}

#pragma - Math Widget Delegate - Recognition Timeout

- (void)mathViewControllerDidReachRecognitionTimeout:(MAWMathViewController *)mathViewController
{
    NSLog(@"Recognition timeout reached");
}




@end