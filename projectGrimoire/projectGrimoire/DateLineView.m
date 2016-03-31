//
//  DateLineView.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "DateLineView.h"

@implementation DateLineView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self setupDateView];
}

- (void)setupDateView {
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.dateLabel.text = @"Friday, April 1";
    self.dateLabel.textColor = [UIColor darkGrayColor];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
    
    [self addSubview:self.dateLabel];
}


@end
