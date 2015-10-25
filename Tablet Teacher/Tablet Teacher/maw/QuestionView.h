//
//  QuestionView.h
//  MathWidgetSample
//
//  Created by Rahman Siddique on 19/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE @interface QuestionView : UIView
@property (strong, nonatomic)IBInspectable IBOutlet UILabel *firstValue;
@property (strong, nonatomic)IBInspectable IBOutlet UILabel *secondValue;
@property (strong, nonatomic)IBInspectable IBOutlet UILabel *operation;
@property (strong, nonatomic) IBOutlet UIView *QuestionView;

@end
