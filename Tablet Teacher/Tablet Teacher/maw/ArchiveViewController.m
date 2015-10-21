//
//  ArchiveViewController.m
//  MathWidgetSample
//
//  Created by Rahman Siddique on 16/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import "ArchiveViewController.h"

@interface ArchiveViewController ()

@end

@implementation ArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILongPressGestureRecognizer *tapGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.worksheetTwoBtn addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTapGesture:(UILongPressGestureRecognizer *)tapGesture {
    NSLog(@"tapGesture:");
    [self becomeFirstResponder];
    //    CGRect targetRectangle = self.tapView.frame;
    CGRect targetRectangle = CGRectMake(100, 100, 300, 100);
    [[UIMenuController sharedMenuController] setTargetRect:targetRectangle inView:self.view];
    
    UIMenuItem *Edit = [[UIMenuItem alloc] initWithTitle:@"Edit" action:@selector(customAction:)];
    UIMenuItem *Tryout = [[UIMenuItem alloc] initWithTitle:@"Tryout" action:@selector(customAction:)];
    UIMenuItem *Assign = [[UIMenuItem alloc] initWithTitle:@"Assign" action:@selector(customAction:)];
    
    [[UIMenuController sharedMenuController] setMenuItems:@[Edit,Tryout,Assign]];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    

    
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
