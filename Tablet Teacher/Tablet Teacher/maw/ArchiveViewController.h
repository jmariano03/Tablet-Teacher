//
//  ArchiveViewController.h
//  MathWidgetSample
//
//  Created by Rahman Siddique on 16/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArchiveViewController : UIViewController<UIPopoverPresentationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *worksheetTwoBtn;
@property (strong, nonatomic) UIViewController *popUpViewController;

@end
