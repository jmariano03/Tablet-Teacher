//
//  StudentAssigmentViewController.m
//  Tablet Teacher
//
//  Created by Rahman Siddique on 23/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import "StudentAssigmentViewController.h"
#import "MGDrawingSlate.h"
#import "StudentWritingCertificate.h"

@implementation StudentAssigmentViewController{
    MGDrawingSlate *drawingSlate;
    UIButton * addButton;
    NSString* Answer;
    UILabel * writingLabel;
    UIButton *clearButton;
}
- (IBAction)tapOnAnswerBoxes:(id)sender {
    NSLog(@"tap onasnwerbox");
}


-(void)viewDidLoad
{
    self.myScriptWritingViewController =[[MAWMathViewController alloc] init];
    self.myScriptWritingViewController.delegate = self;
    self.myScriptWritingViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.writingView addSubview:self.myScriptWritingViewController.view];
    
    NSLog(@"%@",NSStringFromCGRect(self.myScriptWritingViewController.view.frame));
    [self configure];
    
    [self addChildViewController:self.myScriptWritingViewController];
    self.myScriptWritingViewController.view.frame = CGRectMake(0, 0, self.writingView.frame.size.width, self.writingView.frame.size.height);
    [self.writingView addSubview:self.myScriptWritingViewController.view];
    [self.myScriptWritingViewController didMoveToParentViewController:self];
    
    drawingSlate = [[MGDrawingSlate alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view insertSubview:drawingSlate belowSubview:self.writingView];
    //[self.view addSubview:drawingSlate];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTapTap:)];
    [drawingSlate addGestureRecognizer:tapGesture];
    [drawingSlate setAlpha:0.2];
    
    addButton =  [UIButton buttonWithType:UIButtonTypeContactAdd];
    CGRect addButtonRext = addButton.frame;
    // CALCulate the bottom right corner
    addButtonRext.origin.x = self.view.frame.size.width - addButtonRext.size.width - 20;
    addButtonRext.origin.y = self.writingView.frame.size.height-addButtonRext.size.height - 70;
    [addButton setFrame:addButtonRext];
    
    [addButton addTarget:self action:@selector(AddAnswer) forControlEvents:UIControlEventTouchUpInside];
    [self.writingView addSubview:addButton];
    
    
    [self setLabelInMyScriptView];
    
    clearButton =  [[UIButton alloc] init];
    [clearButton setTitle:@"clear" forState:UIControlStateNormal];
    [clearButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    CGRect buttonRect = clearButton.frame;
    buttonRect.size.height = 40;
    buttonRect.size.width = 60;
    // CALCulate the bottom right corner
    buttonRect.origin.x = self.view.frame.size.width - buttonRect.size.width - 10;
    buttonRect.origin.y = 10;
    [clearButton setFrame:buttonRect];
    
    [clearButton addTarget:self.myScriptWritingViewController action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [self.writingView addSubview:clearButton];

}

-(void)AddAnswer
{
    Answer =  [self.myScriptWritingViewController resultAsText];
    UILabel*  QuestionAnswerLabel =
    [[UILabel alloc]initWithFrame:CGRectMake(10,0,self.firstAnswerBox.frame.size.width-10, self.firstAnswerBox.frame.size.height)];
    QuestionAnswerLabel.text = [NSString stringWithFormat:@"%@",Answer];

    [QuestionAnswerLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:24]];
    QuestionAnswerLabel.backgroundColor = [UIColor clearColor];
    QuestionAnswerLabel.textColor = [UIColor blueColor];
    QuestionAnswerLabel.textAlignment = NSTextAlignmentCenter;
    
    if (self.firstAnswerBox.isSelectedView == YES) {
        self.firstAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];

        [self.firstAnswerBox addSubview:QuestionAnswerLabel];
       // }
    }
    
    if (self.secondAnswerBox.isSelectedView == YES) {
        self.secondAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.secondAnswerBox addSubview:QuestionAnswerLabel];
    }
    
    if (self.ThirdAnswerBox.isSelectedView == YES) {
        self.ThirdAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.ThirdAnswerBox addSubview:QuestionAnswerLabel];
    }
    
    if (self.fourthAnswerBox.isSelectedView == YES) {
        self.fourthAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.fourthAnswerBox addSubview:QuestionAnswerLabel];
    }

    if (self.fifthAnswerBox.isSelectedView == YES) {
        self.fifthAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.fifthAnswerBox addSubview:QuestionAnswerLabel];
    }
    
    if (self.sixthAnswerBox.isSelectedView == YES) {
        self.sixthAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.sixthAnswerBox addSubview:QuestionAnswerLabel];
    }
    
    if (self.seventhAnswerBox.isSelectedView == YES) {
        self.seventhAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.seventhAnswerBox addSubview:QuestionAnswerLabel];
    }
    
    if (self.EigthAnswerBox.isSelectedView == YES) {
        self.EigthAnswerBox.answer = [NSString stringWithFormat:@"%@",Answer];
        [self.EigthAnswerBox addSubview:QuestionAnswerLabel];
    }
    [self checkToShowSubmitButton];
}

-(void)checkToShowSubmitButton
{
    if (   ![self.firstAnswerBox.answer isEqualToString:@""]
        && ![self.secondAnswerBox.answer isEqualToString:@""]
        && ![self.ThirdAnswerBox.answer isEqualToString:@""]
        && ![self.fourthAnswerBox.answer isEqualToString:@""]
        && ![self.fifthAnswerBox.answer isEqualToString:@""]
        && ![self.sixthAnswerBox.answer isEqualToString:@""]
        && ![self.seventhAnswerBox.answer isEqualToString:@""]
        && ![self.EigthAnswerBox.answer isEqualToString:@""]
        && self.firstAnswerBox.answer != nil
        && self.secondAnswerBox.answer != nil
        && self.ThirdAnswerBox.answer != nil
        && self.fourthAnswerBox.answer != nil
        && self.fifthAnswerBox.answer != nil
        && self.sixthAnswerBox.answer != nil
        && self.seventhAnswerBox.answer != nil
        && self.EigthAnswerBox.answer != nil) {
        self.submitButton.userInteractionEnabled = YES;
        self.submitButton.alpha = 1.0;
    }
}

-(void)tapTapTap:(UITapGestureRecognizer *) tap{
        NSLog(@"tap onasnwerbox");
    BOOL isAnyBoxTapped = NO;
    
    self.firstAnswerBox.isSelectedView = NO;
    self.firstAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.firstAnswerBox.layer.borderWidth = 0.0f;
    
    self.secondAnswerBox.isSelectedView = NO;
    self.secondAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.secondAnswerBox.layer.borderWidth = 0.0f;
    
    self.ThirdAnswerBox.isSelectedView = NO;
    self.ThirdAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.ThirdAnswerBox.layer.borderWidth = 0.0f;

    self.fourthAnswerBox.isSelectedView = NO;
    self.fourthAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.fourthAnswerBox.layer.borderWidth = 0.0f;
    
    self.fifthAnswerBox.isSelectedView = NO;
    self.fifthAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.fifthAnswerBox.layer.borderWidth = 0.0f;
    
    self.sixthAnswerBox.isSelectedView = NO;
    self.sixthAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.sixthAnswerBox.layer.borderWidth = 0.0f;
    
    self.seventhAnswerBox.isSelectedView = NO;
    self.seventhAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.seventhAnswerBox.layer.borderWidth = 0.0f;
    
        self.EigthAnswerBox.isSelectedView = NO;
    self.EigthAnswerBox.layer.borderColor = [UIColor clearColor].CGColor;
    self.EigthAnswerBox.layer.borderWidth = 0.0f;
    
    CGPoint location = [tap locationInView:self.view];
        if(CGRectContainsPoint(self.firstAnswerBox.frame, location))
        {
            NSLog(@"tap on first");
            self.firstAnswerBox.isSelectedView = YES;
            self.firstAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
            self.firstAnswerBox.layer.borderWidth = 3.0f;
            isAnyBoxTapped = YES;
        }
    if(CGRectContainsPoint(self.secondAnswerBox.frame, location))
    {
        NSLog(@"tap on two");
        self.secondAnswerBox.isSelectedView = YES;
        self.secondAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.secondAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
    }
    if(CGRectContainsPoint(self.ThirdAnswerBox.frame, location))
    {
        NSLog(@"tap on three");
        self.ThirdAnswerBox.isSelectedView = YES;
        self.ThirdAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.ThirdAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
    }
    if(CGRectContainsPoint(self.fourthAnswerBox.frame, location))
    {
        NSLog(@"tap on four");
        self.fourthAnswerBox.isSelectedView = YES;
        self.fourthAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.fourthAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
    }
    if(CGRectContainsPoint(self.fifthAnswerBox.frame, location))
    {
        NSLog(@"tap on five");
        self.fifthAnswerBox.isSelectedView = YES;
        self.fifthAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.fifthAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
        
    }
    if(CGRectContainsPoint(self.sixthAnswerBox.frame, location))
    {
        NSLog(@"tap on six");
        self.sixthAnswerBox.isSelectedView = YES;
        self.sixthAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.sixthAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
    }
    if(CGRectContainsPoint(self.seventhAnswerBox.frame, location))
    {
        NSLog(@"tap on seven");
        self.seventhAnswerBox.isSelectedView = YES;
        self.seventhAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.seventhAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
    }
    if(CGRectContainsPoint(self.EigthAnswerBox.frame, location))
    {
        NSLog(@"tap on eight");
        self.EigthAnswerBox.isSelectedView = YES;
        self.EigthAnswerBox.layer.borderColor = [UIColor blueColor].CGColor;
        self.EigthAnswerBox.layer.borderWidth = 3.0f;
                    isAnyBoxTapped = YES;
    }
    
    if (isAnyBoxTapped ) {
        writingLabel.hidden = YES;
    }
}
- (IBAction)submitBtnPressed:(id)sender {
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Assignment submission" message:@"Please confirm you want to submit. Your work will be graded and submitted to the teacher." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"submit", nil];
    [alertview show];
}

-(void) setLabelInMyScriptView
{
    writingLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,600, 200)];
    
    
    writingLabel.text = @"Write Answer here";
    [writingLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:36]];
    //    fromLabel.font = customFont;
    //    fromLabel.numberOfLines = 1;
    //    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    //    fromLabel.adjustsFontSizeToFitWidth = YES;
    //    fromLabel.adjustsLetterSpacingToFitWidth = YES;
    //    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    //    fromLabel.clipsToBounds = YES;
    writingLabel.backgroundColor = [UIColor clearColor];
    writingLabel.textColor = [UIColor whiteColor];
    writingLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.writingView addSubview:writingLabel];
    
    writingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    //Adding Constraint to center horizontally and vertically
    NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:writingLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.writingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.writingView addConstraint:xCenterConstraint];
    
    NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:writingLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.writingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.writingView addConstraint:yCenterConstraint];
    
    
    [self.writingView layoutIfNeeded];
    [self.view layoutIfNeeded];
    
}


- (IBAction)answerBtnPressed:(id)sender {
    self.firstAnswerBox.hidden = NO;
        self.secondAnswerBox.hidden = NO;
        self.ThirdAnswerBox.hidden = NO;
        self.fourthAnswerBox.hidden = NO;
        self.fifthAnswerBox.hidden = NO;
        self.sixthAnswerBox.hidden = NO;
        self.seventhAnswerBox.hidden = NO;
        self.EigthAnswerBox.hidden = NO;
    
    [self disableDrawButton];
    [self disableEraseButton];
    

}
- (IBAction)drawBtnPressed:(id)sender {
    drawingSlate.hidden = NO;
    drawingSlate->drawingColor = [UIColor blackColor];
    drawingSlate->isInDrawingMode = YES;
}

-(void) disableWritingPad{
    self.writingView.userInteractionEnabled = NO;;
    self.writingView.alpha = 0.4;
}

-(void) disableDrawButton{
    self.drawButton.userInteractionEnabled = NO;
    self.drawButton.alpha = 0.4;
}
-(void) disableEraseButton{
    self.eraseButton.userInteractionEnabled = NO;
    self.eraseButton.alpha = 0.4;
    
}
-(void) disableAnswerButton{
    self.answerButton.userInteractionEnabled = NO;
    self.answerButton.alpha = 0.4;
    
}
-(void) disableSubmitButton{
    self.submitButton.userInteractionEnabled = NO;
    self.submitButton.alpha = 0.4;
}

-(void) enableWritingPad{
    self.writingView.userInteractionEnabled = YES;
    self.writingView.alpha = 1.0;
}
-(void) enableDrawButton{
    self.drawButton.userInteractionEnabled = YES;
    self.drawButton.alpha = 1.0;
}
-(void) enableEraseButton{
    self.eraseButton.userInteractionEnabled = YES;
    self.eraseButton.alpha = 1.0;
}
-(void) enableAnswerButton{
    self.answerButton.userInteractionEnabled = YES;
    self.answerButton.alpha = 1.0;
}
-(void) enableSubmitButton{
    self.submitButton.userInteractionEnabled = YES;
    self.submitButton.alpha = 1.0;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSLog(@"submit pressed");
        [self checkAssignmentResult];
    }
    
    if (buttonIndex == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void)checkAssignmentResult{
    double counter = 0;
    if ([self.firstAnswerBox.answer  isEqual: @"0"]) {
        counter++;
        self.firstAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.firstAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.secondAnswerBox.answer  isEqual: @"4"]) {
        counter++;
        self.secondAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.secondAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.ThirdAnswerBox.answer  isEqual: @"3"]) {
        counter++;
        self.ThirdAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.ThirdAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.fourthAnswerBox.answer  isEqual: @"13"]) {
        counter++;
        self.fourthAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.fourthAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.fifthAnswerBox.answer  isEqual: @"6"]) {
        counter++;
        self.fifthAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.fifthAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.sixthAnswerBox.answer  isEqual: @"10"]) {
        counter++;
        self.sixthAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.sixthAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.seventhAnswerBox.answer  isEqual: @"5"]) {
        counter++;
        self.seventhAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.seventhAnswerBox.isAnswerCorrect  = NO;
    }
    
    if ([self.EigthAnswerBox.answer  isEqual: @"1"]) {
        counter++;
        self.EigthAnswerBox.isAnswerCorrect  = YES;
    }
    else
    {
        self.EigthAnswerBox.isAnswerCorrect  = YES;
    }
    
    double percentage = (counter/8.0 )*100;
    
    UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"Result" message:[NSString stringWithFormat:@"You have obtained %.f percent",percentage] delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    [alertview show];
}

-(void)didReceiveMemoryWarning
{
    
}
- (IBAction)eraseBtnisPressed:(id)sender {
    drawingSlate->isInDrawingMode = NO;
    drawingSlate->drawingColor = [UIColor whiteColor];
}

- (void)configure
{
    // Recognition resources
    NSArray *resources   = @[@"math-ak.res", @"math-grm-maw.res"];
    
    // Certificate
    NSData  *certificate = [NSData dataWithBytes:studentCertificate.bytes length:studentCertificate.length];
    
    [_myScriptWritingViewController configureWithResources:resources
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
    writingLabel.hidden = YES;
}

- (void)mathViewControllerDidEndWriting:(MAWMathViewController *)mathViewController
{
    NSLog(@"End writing");
    
    NSString * result = [mathViewController resultAsText];
    NSLog(@"result of equation %@",result);
    
    Answer = @"";
    Answer = result;
}

#pragma - Math Widget Delegate - Recognition Timeout

- (void)mathViewControllerDidReachRecognitionTimeout:(MAWMathViewController *)mathViewController
{
    NSLog(@"Recognition timeout reached");
}


@end
