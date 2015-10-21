//
//  QuestionView.m
//  MathWidgetSample
//
//  Created by Rahman Siddique on 19/10/2015.
//  Copyright © 2015 MyScript. All rights reserved.
//

#import "QuestionView.h"

@implementation QuestionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"QuestionView" owner:self options:nil];
        [self addSubview:self.QuestionView];
        return self;
    }
    return self;
}

@end
