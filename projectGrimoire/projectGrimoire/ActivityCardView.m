//
//  ActivityCardView.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ActivityCardView.h"

@implementation ActivityCardView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self setupCardSubviews];
}
*/

- (void)setupCardSubviews {
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height/3-10)];
    self.nameLabel.text = @"Repeat The Words";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:25.0];
    
    self.estimatedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.size.height+10+30, self.nameLabel.frame.size.width, self.nameLabel.frame.size.height/2)];
    self.estimatedTimeLabel.text = @"Estimated Time: 10 mins";
    self.estimatedTimeLabel.textColor = [UIColor whiteColor];
    self.estimatedTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.estimatedTimeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
    
    [self addSubview:self.nameLabel];
    [self addSubview:self.estimatedTimeLabel];
}

- (void)updateNameWithText:(NSString *)name {
    [self.nameLabel setText:name];
    [self setNeedsDisplay];
}

- (void)updateTimeWithText:(NSString *)time {
    [self.nameLabel setText:[NSString stringWithFormat:@"Estimated Time: %@", time]];
    [self setNeedsDisplay];
}

@end
