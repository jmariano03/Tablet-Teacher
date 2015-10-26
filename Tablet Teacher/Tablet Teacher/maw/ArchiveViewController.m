//
//  ArchiveViewController.m
//  MathWidgetSample
//
//  Created by Rahman Siddique on 16/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import "ArchiveViewController.h"

@interface ArchiveViewController ()
{
    UIButton *Assign;
    UIButton *Tryout;
    UIButton *Edit;
}

@end

@implementation ArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.worksheetTwoBtn addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTapGesture:(UITapGestureRecognizer *)longpress {
    NSLog(@"tapGesture:");
    CGPoint location = [longpress locationInView:self.view];
//    [self becomeFirstResponder];
//    //    CGRect targetRectangle = self.tapView.frame;
//    CGRect targetRectangle = CGRectMake(100, 100, 300, 100);
//    [[UIMenuController sharedMenuController] setTargetRect:targetRectangle inView:self.view];
//    
//    UIMenuItem *Edit = [[UIMenuItem alloc] initWithTitle:@"Edit" action:@selector(customAction:)];
//    UIMenuItem *Tryout = [[UIMenuItem alloc] initWithTitle:@"Tryout" action:@selector(customAction:)];
//    UIMenuItem *Assign = [[UIMenuItem alloc] initWithTitle:@"Assign" action:@selector(customAction:)];
//    
//    [[UIMenuController sharedMenuController] setMenuItems:@[Edit,Tryout,Assign]];
//    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
 
        self.popUpViewController = [[UIViewController alloc] init];
        self.popUpViewController.modalPresentationStyle = UIModalPresentationPopover;
        
        Edit = [UIButton buttonWithType:UIButtonTypeCustom];
        [Edit addTarget:self action:@selector(EditBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [Edit setTitle:@"Edit" forState:UIControlStateNormal];
        [Edit setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [Edit setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        Edit.frame = CGRectMake(10, 10,60 ,100);
        
        Assign = [UIButton buttonWithType:UIButtonTypeCustom];
        //[Assign addTarget:self action:@selector(EditBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [Assign setTitle:@"Assign" forState:UIControlStateNormal];
        [Assign setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        Assign.frame = CGRectMake(Edit.frame.size.width +Edit.frame.origin.x + 20, 10,60 ,100);
        
        Tryout = [UIButton buttonWithType:UIButtonTypeCustom];
        //[Tryout addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
        [Tryout setTitle:@"Tryout" forState:UIControlStateNormal];
        [Tryout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        Tryout.frame = CGRectMake(Assign.frame.size.width + Assign.frame.origin.x + 20, 10,60 ,100);
        
        [self.popUpViewController.view addSubview:Edit];
        [self.popUpViewController.view addSubview:Assign];
        [self.popUpViewController.view addSubview:Tryout];
        UIPopoverPresentationController * popOverController =  self.popUpViewController.popoverPresentationController;
        [popOverController setDelegate:self];
        self.popUpViewController.preferredContentSize = CGSizeMake(250, 100);
        popOverController.sourceView = self.view;
        popOverController.sourceRect = CGRectMake(location.x-30, location.y-75,100,100);
        popOverController.permittedArrowDirections = UIPopoverArrowDirectionUp;
        
        [self presentViewController:self.popUpViewController
                           animated:YES
                         completion:nil];
}

- (IBAction)worksheet2btnPressed:(id)sender {
    
    
}

-(void)EditBtnPressed
{
    NSLog(@"Edit Btn Pressed");
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers lastObject];
}
- (IBAction)worksheetOneBtnPressed:(id)sender
{
        self.popUpViewController = [[UIViewController alloc] init];
        self.popUpViewController.modalPresentationStyle = UIModalPresentationPopover;
        
        Edit = [UIButton buttonWithType:UIButtonTypeCustom];
        //[Edit addTarget:self action:@selector(EditBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [Edit setTitle:@"Edit" forState:UIControlStateNormal];
        [Edit setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [Edit setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        Edit.frame = CGRectMake(10, 10,60 ,100);
        
        Assign = [UIButton buttonWithType:UIButtonTypeCustom];
        //[Assign addTarget:self action:@selector(EditBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [Assign setTitle:@"Assign" forState:UIControlStateNormal];
        [Assign setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        Assign.frame = CGRectMake(Edit.frame.size.width +Edit.frame.origin.x + 20, 10,60 ,100);
        
        Tryout = [UIButton buttonWithType:UIButtonTypeCustom];
        //[Tryout addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
        [Tryout setTitle:@"Tryout" forState:UIControlStateNormal];
        [Tryout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        Tryout.frame = CGRectMake(Assign.frame.size.width + Assign.frame.origin.x + 20, 10,60 ,100);
        
        [self.popUpViewController.view addSubview:Edit];
        [self.popUpViewController.view addSubview:Assign];
        [self.popUpViewController.view addSubview:Tryout];
        UIPopoverPresentationController * popOverController =  self.popUpViewController.popoverPresentationController;
        [popOverController setDelegate:self];
        self.popUpViewController.preferredContentSize = CGSizeMake(250, 100);
        popOverController.sourceView = self.view;
        popOverController.sourceRect = CGRectMake(20,120,100,100);
        popOverController.permittedArrowDirections = UIPopoverArrowDirectionUp;
        
        [self presentViewController:self.popUpViewController
                           animated:YES
                         completion:nil];

}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    BOOL result = NO;
    if(@selector(copy:) == action || @selector(customAction:) == action) {
        result = YES;
    }
    return result;
}

// UIMenuController Methods

// Default copy method
- (void)copy:(id)sender {
    NSLog(@"Copy");
}

// Our custom method
- (void)customAction:(id)sender {
    NSLog(@"Custom Action");
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
