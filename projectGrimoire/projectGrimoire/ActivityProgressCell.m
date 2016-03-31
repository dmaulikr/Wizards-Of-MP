//
//  ActivityProgressCell.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ActivityProgressCell.h"

@implementation ActivityProgressCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withProgressData:(ActivityProgressData*) progressData{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.progressData = progressData;
        [self setupCellView];
    }
    return self;
}

- (void)setupCellView {
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.nameLabel = [UILabel new];
    [self.nameLabel setFrame:CGRectZero];
    [self.nameLabel setTextColor:[UIColor darkGrayColor]];
    [self.nameLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.nameLabel setBackgroundColor:[UIColor purpleColor]];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    [self.nameLabel setNumberOfLines:1];
//    self.nameLabel.text = @"Repeat The Words";
    self.nameLabel.text = self.progressData.name;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
    
    self.statusLabel = [UILabel new];
    [self.statusLabel setFrame:CGRectZero];
    
    if([self.progressData.status isEqualToString:@"Completed"]) {
        [self.statusLabel setTextColor:[UIColor blueColor]];
    }
    else {
        [self.statusLabel setTextColor:[UIColor redColor]];
    }
    
    [self.statusLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.statusLabel setBackgroundColor:[UIColor purpleColor]];
    [self.statusLabel setFont:[UIFont fontWithName:@"Helvetica-LightOblique" size:15]];
    [self.statusLabel setNumberOfLines:1];
    self.statusLabel.text = self.progressData.status;
    self.statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.statusLabel.adjustsFontSizeToFitWidth = YES;
    
    self.completedDateLabel = [UILabel new];
    [self.completedDateLabel setFrame:CGRectZero];
    [self.completedDateLabel setTextColor:[UIColor blackColor]];
    [self.completedDateLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.completedDateLabel setBackgroundColor:[UIColor purpleColor]];
    [self.completedDateLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    [self.completedDateLabel setNumberOfLines:1];
    self.completedDateLabel.text = self.progressData.dateCompleted;
    self.completedDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.completedDateLabel.adjustsFontSizeToFitWidth = YES;
    
//    self.finishedDateLabel = [UILabel new];
//    [self.finishedDateLabel setFrame:CGRectZero];
//    [self.finishedDateLabel setTextColor:[UIColor blackColor]];
//    [self.finishedDateLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.finishedDateLabel setBackgroundColor:[UIColor purpleColor]];
//    [self.finishedDateLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
//    [self.finishedDateLabel setNumberOfLines:1];
//    self.finishedDateLabel.text = self.testStatusData.finishedDate;
//    self.finishedDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    self.finishedDateLabel.adjustsFontSizeToFitWidth = YES;
    
    self.viewScoreLabel = [UILabel new];
    [self.viewScoreLabel setFrame:CGRectZero];
    [self.viewScoreLabel setTextColor:[UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f]];
    [self.viewScoreLabel setTextAlignment:NSTextAlignmentRight];
//    [self.viewScoreLabel setBackgroundColor:[UIColor purpleColor]];
    [self.viewScoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    [self.viewScoreLabel setNumberOfLines:1];
    [self.viewScoreLabel setHidden:YES];
    self.viewScoreLabel.text = @"View Score >";
    self.viewScoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.viewScoreLabel.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.nameLabel];
    [self addSubview:self.statusLabel];
    [self addSubview:self.completedDateLabel];
//    [self addSubview:self.finishedDateLabel];
    [self addSubview:self.viewScoreLabel];
    
    [self setupConstraintsForCellView];
}

- (void)setupConstraintsForCellView {
    
    NSLayoutConstraint *nameLabelLeftConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.nameLabel attribute:NSLayoutAttributeLeft
                                                  relatedBy:NSLayoutRelationEqual toItem:self
                                                  attribute:NSLayoutAttributeLeft multiplier:1 constant:15];
    NSLayoutConstraint *nameLabelTopConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.nameLabel attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual toItem:self
                                                 attribute:NSLayoutAttributeTop multiplier:1 constant:5];
    
    NSLayoutConstraint *nameLabelHeightConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual toItem:self
                                                    attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0];
    NSLayoutConstraint *nameLabelWidthConstraint = [NSLayoutConstraint
                                                   constraintWithItem:self.nameLabel attribute:NSLayoutAttributeWidth
                                                   relatedBy:NSLayoutRelationEqual toItem:self
                                                   attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    
    NSLayoutConstraint *statusLabelLeftConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.statusLabel attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *statusLabelTopConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.statusLabel attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                    attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *statusLabelHeightConstraint = [NSLayoutConstraint
                                                       constraintWithItem:self.statusLabel attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual toItem:self
                                                       attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *statusLabelWidthConstraint = [NSLayoutConstraint
                                                      constraintWithItem:self.statusLabel attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual toItem:self
                                                      attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    NSLayoutConstraint *completedDateLabelLeftConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.completedDateLabel attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                          attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *completedDateLabelTopConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.completedDateLabel attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual toItem:self.statusLabel
                                                         attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *completedDateLabelHeightConstraint = [NSLayoutConstraint
                                                            constraintWithItem:self.completedDateLabel attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual toItem:self
                                                            attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *completedDateLabelWidthConstraint = [NSLayoutConstraint
                                                           constraintWithItem:self.completedDateLabel attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual toItem:self
                                                           attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0];
    
//    NSLayoutConstraint *finishedDateLabelLeftConstraint = [NSLayoutConstraint
//                                                           constraintWithItem:self.finishedDateLabel attribute:NSLayoutAttributeLeft
//                                                           relatedBy:NSLayoutRelationEqual toItem:self.startedDateLabel
//                                                           attribute:NSLayoutAttributeRight multiplier:1 constant:0];
//    NSLayoutConstraint *finishedDateLabelTopConstraint = [NSLayoutConstraint
//                                                          constraintWithItem:self.finishedDateLabel attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual toItem:self.statusLabel
//                                                          attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
//    
//    NSLayoutConstraint *finishedDateLabelHeightConstraint = [NSLayoutConstraint
//                                                             constraintWithItem:self.finishedDateLabel attribute:NSLayoutAttributeHeight
//                                                             relatedBy:NSLayoutRelationEqual toItem:self
//                                                             attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
//    NSLayoutConstraint *finishedDateLabelWidthConstraint = [NSLayoutConstraint
//                                                            constraintWithItem:self.finishedDateLabel attribute:NSLayoutAttributeWidth
//                                                            relatedBy:NSLayoutRelationEqual toItem:self
//                                                            attribute:NSLayoutAttributeWidth multiplier:0.35 constant:0];
    
    NSLayoutConstraint *viewScoreLabelRightConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.viewScoreLabel attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual toItem:self
                                                         attribute:NSLayoutAttributeRight multiplier:1 constant:-15];
    NSLayoutConstraint *viewScoreLabelCenterYConstraint = [NSLayoutConstraint
                                                           constraintWithItem:self.viewScoreLabel attribute:NSLayoutAttributeCenterY
                                                           relatedBy:NSLayoutRelationEqual toItem:self
                                                           attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    NSLayoutConstraint *viewScoreLabelHeightConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.viewScoreLabel attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual toItem:self
                                                          attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *viewScoreLabelWidthConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.viewScoreLabel attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual toItem:self
                                                         attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    [self addConstraints:@[nameLabelLeftConstraint, nameLabelTopConstraint, nameLabelHeightConstraint, nameLabelWidthConstraint,
                           statusLabelLeftConstraint, statusLabelTopConstraint, statusLabelHeightConstraint, statusLabelWidthConstraint,
                           completedDateLabelLeftConstraint, completedDateLabelTopConstraint, completedDateLabelHeightConstraint, completedDateLabelWidthConstraint,
                           /*finishedDateLabelLeftConstraint, finishedDateLabelTopConstraint, finishedDateLabelHeightConstraint, finishedDateLabelWidthConstraint,*/
                           viewScoreLabelRightConstraint, viewScoreLabelCenterYConstraint, viewScoreLabelHeightConstraint, viewScoreLabelWidthConstraint]];
}

@end
