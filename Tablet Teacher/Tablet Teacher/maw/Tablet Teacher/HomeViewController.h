//
//  HomeViewController.h
//  MathWidgetSample
//
//  Created by Rahman Siddique on 16/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UIPopoverPresentationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIView *LongTapView;
@property (nonatomic, strong) UIViewController *studentInfoController;

@end
