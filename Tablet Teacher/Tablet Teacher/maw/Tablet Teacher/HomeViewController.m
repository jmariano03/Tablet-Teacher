//
//  HomeViewController.m
//  MathWidgetSample
//
//  Created by Rahman Siddique on 16/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) UIVisualEffectView *blurEffectView;

@end

@implementation HomeViewController
BOOL isLongTapViewIsOnScreen;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.LongTapView.hidden = YES;
    //Add a long Press
    UILongPressGestureRecognizer *recoginzer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onPress:)];
    [self.view addGestureRecognizer:recoginzer];
    
    //Add a tap gesture to remove the LongTapView
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    if (isLongTapViewIsOnScreen)
    {
        [self.blurEffectView removeFromSuperview];
        self.LongTapView.hidden = YES;
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        isLongTapViewIsOnScreen = NO;
    }
}

- (IBAction)backToMainBtnPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)onPress:(UILongPressGestureRecognizer*)longpress
{
    CGPoint location = [longpress locationInView:self.view];
    self.LongTapView.hidden = NO;
    
    if (longpress.state == UIGestureRecognizerStateBegan)
    {
        self.studentInfoController = [[UIViewController alloc] init];
        self.studentInfoController.modalPresentationStyle = UIModalPresentationPopover;
        self.studentInfoController.preferredContentSize = CGSizeMake(200, 200);
        UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200,200)];

        fromLabel.numberOfLines = 10;
        fromLabel.text = @" Umer Afzal \n Summary: \n - Overall Grade \n Assigments";
        
        [self.studentInfoController.view addSubview:fromLabel];
        //[self.studentInfoController.view addSubview:toLabel];
        
        UIPopoverPresentationController * popOverController =  self.studentInfoController.popoverPresentationController;
        [popOverController setDelegate:self];
        popOverController.sourceView = self.view;
        popOverController.sourceRect = CGRectMake(location.x-60, location.y-50,200,100);
        popOverController.permittedArrowDirections = UIPopoverArrowDirectionUp;
        
        [self presentViewController:self.studentInfoController
                           animated:YES
                         completion:nil];

    }
    else if (longpress.state == UIGestureRecognizerStateEnded || longpress.state == UIGestureRecognizerStateCancelled || longpress.state == UIGestureRecognizerStateFailed)
    {
        
    }
}

-(void) addBlurEffectToMainView
{
    //Making a blur effect View
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    [self.blurEffectView setFrame:self.view.bounds];
    
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    [vibrancyEffectView setFrame:self.view.bounds];
    
    self.blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    vibrancyEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.blurEffectView.contentView addSubview:vibrancyEffectView];
    [self.view insertSubview:self.blurEffectView belowSubview:self.LongTapView];
}

-(void) addStudentInformationtoPopUpView:(CGPoint)location
{
    UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200,100)];
    UILabel *toLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,fromLabel.frame.size.height, self.LongTapView.frame.size.width,50)];
    toLabel.numberOfLines = 8;
    fromLabel.text = @" Umer Afzal";
    toLabel.text = @" Summary: \n - Overall Grade \n Assigments";
    [self.LongTapView addSubview:fromLabel];
    [self.LongTapView addSubview:toLabel];
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

//        if (!self.LongTapView)
//        {
//            self.LongTapView = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 200, 100)];
//            self.LongTapView.backgroundColor = [UIColor yellowColor];
//            [self.view addSubview:self.LongTapView];
//        }
//        else
//        {
//            self.LongTapView.frame = CGRectMake(location.x, location.y, 200, 100);
//        }
//        [self addStudentInformationtoPopUpView:location];
//
//        [UIView animateWithDuration:0.6 animations:^{
//            CGAffineTransform moveTrans = CGAffineTransformMakeTranslation(0, -40);
//            self.LongTapView.transform = moveTrans;
//        }];
//        NSLog(@"Long press");
//
//        //Blur the Screen
//        if (!UIAccessibilityIsReduceTransparencyEnabled()) {
//            //Clear the background
//            self.view.backgroundColor = [UIColor clearColor];
//            [self addBlurEffectToMainView];
//        }
//        else
//        {
//            self.view.backgroundColor = [UIColor blackColor];
//        }
//        isLongTapViewIsOnScreen = YES;



//else

//        //Show the View
//        [UIView animateWithDuration:0.6 animations:^{
//            CGAffineTransform moveTrans = CGAffineTransformMakeTranslation(0, 40);
//            self.LongTapView.transform = moveTrans;
//            NSLog(@"long press done");
//
//        }];
