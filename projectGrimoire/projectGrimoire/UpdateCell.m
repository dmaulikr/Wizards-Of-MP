//
//  UpdateCell.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "UpdateCell.h"

@implementation UpdateCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withUpdateData:(UpdateData*)updateData {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.updateData = updateData;
        [self setupCellView];
    }
    return self;
}

- (void)setupCellView {
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.profileImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    //    [self.profileImageView setImage:[UIImage imageNamed:@"client1"]];
    [self.profileImageView setImage:[UIImage imageNamed:self.updateData.profileImageName]];
    self.profileImageView.layer.cornerRadius = 10;
    self.profileImageView.translatesAutoresizingMaskIntoConstraints = NO;
    //    self.profileImageView.layer.borderColor = [[UIColor blackColor] CGColor];
    //    self.profileImageView.layer.borderWidth = .5;
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.profileImageView setClipsToBounds:YES];
    
    self.nameLabel = [UILabel new];
    [self.nameLabel setFrame:CGRectZero];
    [self.nameLabel setTextColor:[UIColor darkGrayColor]];
    [self.nameLabel setTextAlignment:NSTextAlignmentLeft];
    //    [self.nameLabel setBackgroundColor:[UIColor purpleColor]];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    [self.nameLabel setNumberOfLines:1];
    //    self.nameLabel.text = @"Repeat The Words";
    self.nameLabel.text = self.updateData.name;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
    
    self.completeDateLabel = [UILabel new];
    [self.completeDateLabel setFrame:CGRectZero];
    [self.completeDateLabel setTextColor:[UIColor blackColor]];
    [self.completeDateLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.lastSessionDateLabel setBackgroundColor:[UIColor purpleColor]];
    [self.completeDateLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:8]];
    [self.completeDateLabel setNumberOfLines:1];
    self.completeDateLabel.text = self.updateData.completeDate;
    self.completeDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.completeDateLabel.adjustsFontSizeToFitWidth = YES;
    
    self.lastActivityLabel = [UILabel new];
    [self.lastActivityLabel setFrame:CGRectZero];
    [self.lastActivityLabel setTextColor:[UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f]];
    [self.lastActivityLabel setTextAlignment:NSTextAlignmentLeft];
    //    [self.viewClientLabel setBackgroundColor:[UIColor purpleColor]];
    [self.lastActivityLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:8]];
    [self.lastActivityLabel setNumberOfLines:1];
    [self.lastActivityLabel setHidden:NO];
    self.lastActivityLabel.text = self.updateData.lastActivity;
    self.lastActivityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastActivityLabel.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.profileImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.completeDateLabel];
    [self addSubview:self.lastActivityLabel];
    
    [self setupConstraintsForCellView];
}

- (void)setupConstraintsForCellView {
    
    NSLayoutConstraint *profileImageCenterYConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.profileImageView attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual toItem:self
                                                         attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSLayoutConstraint *profileImageCenterXConstraint  = [NSLayoutConstraint
                                                          constraintWithItem:self.profileImageView attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual toItem:self
                                                          attribute:NSLayoutAttributeCenterX multiplier:0.20 constant:0];
    
    NSLayoutConstraint *profileImageWidthConstraint  = [NSLayoutConstraint
                                                        constraintWithItem:self.profileImageView attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual toItem:self
                                                        attribute:NSLayoutAttributeWidth multiplier:0.10 constant:0];
    
    NSLayoutConstraint *profileImageHeightConstraint  = [NSLayoutConstraint
                                                         constraintWithItem:self.profileImageView attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual toItem:self.profileImageView
                                                         attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint *nameLabelLeftConstraint = [NSLayoutConstraint
                                                   constraintWithItem:self.nameLabel attribute:NSLayoutAttributeLeft
                                                   relatedBy:NSLayoutRelationEqual toItem:self.profileImageView
                                                   attribute:NSLayoutAttributeRight multiplier:1 constant:15];
    NSLayoutConstraint *nameLabelTopConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.nameLabel attribute:NSLayoutAttributeTop
                                                  relatedBy:NSLayoutRelationEqual toItem:self
                                                  attribute:NSLayoutAttributeTop multiplier:1 constant:3];
    
    NSLayoutConstraint *nameLabelHeightConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual toItem:self
                                                     attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0];
    NSLayoutConstraint *nameLabelWidthConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.nameLabel attribute:NSLayoutAttributeWidth
                                                    relatedBy:NSLayoutRelationEqual toItem:self
                                                    attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    
    NSLayoutConstraint *lastActivityLabelLeftConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.lastActivityLabel attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                          attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *lastActivityLabelTopConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.lastActivityLabel attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                         attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *lastActivityLabelHeightConstraint = [NSLayoutConstraint
                                                            constraintWithItem:self.lastActivityLabel attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual toItem:self
                                                            attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *lastActivityLabelWidthConstraint = [NSLayoutConstraint
                                                           constraintWithItem:self.lastActivityLabel attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual toItem:self
                                                           attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    NSLayoutConstraint *completeDateLabelLeftConstraint = [NSLayoutConstraint
                                                              constraintWithItem:self.completeDateLabel attribute:NSLayoutAttributeLeft
                                                              relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                              attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *completeDateLabelTopConstraint = [NSLayoutConstraint
                                                             constraintWithItem:self.completeDateLabel attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual toItem:self.lastActivityLabel
                                                             attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *completeDateLabelHeightConstraint = [NSLayoutConstraint
                                                                constraintWithItem:self.completeDateLabel attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual toItem:self
                                                                attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *completeDateLabelWidthConstraint = [NSLayoutConstraint
                                                               constraintWithItem:self.completeDateLabel attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual toItem:self
                                                               attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    [self addConstraints:@[profileImageCenterXConstraint, profileImageCenterYConstraint, profileImageHeightConstraint, profileImageWidthConstraint,
                           nameLabelLeftConstraint, nameLabelTopConstraint, nameLabelHeightConstraint, nameLabelWidthConstraint,
                           lastActivityLabelHeightConstraint, lastActivityLabelLeftConstraint, lastActivityLabelTopConstraint, lastActivityLabelWidthConstraint,
                           completeDateLabelHeightConstraint, completeDateLabelLeftConstraint, completeDateLabelTopConstraint, completeDateLabelWidthConstraint]];
}

@end
