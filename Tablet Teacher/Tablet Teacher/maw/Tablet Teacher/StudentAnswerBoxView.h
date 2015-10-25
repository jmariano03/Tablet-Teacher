//
//  StudentAnswerBoxView.h
//  Tablet Teacher
//
//  Created by Rahman Siddique on 24/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentAnswerBoxView : UIView
@property (strong,nonatomic) NSString* answer;

@property (assign,nonatomic) BOOL isSelectedView;
@property (assign,nonatomic) BOOL isAnswerCorrect;
@end
