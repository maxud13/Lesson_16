//
//  HeaderView.m
//  Lesson_16
//
//  Created by maxud on 03.10.17.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
        UIView *nibView = array.firstObject;
        [self addSubview:nibView];
    }
    return self;
    
}

@end
