//
//  ClientInfoCell.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ClientInfoCell.h"

@implementation ClientInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withClientData:(ClientInfoData*) clientData{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clientData = clientData;
        [self setupCellView];
    }
    return self;
}

- (void)setupCellView {
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.profileImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
//    [self.profileImageView setImage:[UIImage imageNamed:@"client1"]];
    [self.profileImageView setImage:[UIImage imageNamed:self.clientData.profileImageName]];
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
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    [self.nameLabel setNumberOfLines:1];
//    self.nameLabel.text = @"Repeat The Words";
    self.nameLabel.text = self.clientData.name;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
    
    self.lastSessionDateLabel = [UILabel new];
    [self.lastSessionDateLabel setFrame:CGRectZero];
    [self.lastSessionDateLabel setTextColor:[UIColor blackColor]];
    [self.lastSessionDateLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.lastSessionDateLabel setBackgroundColor:[UIColor purpleColor]];
    [self.lastSessionDateLabel setFont:[UIFont fontWithName:@"Helvetica-LightOblique" size:15]];
    [self.lastSessionDateLabel setNumberOfLines:1];
    self.lastSessionDateLabel.text = self.clientData.lastSessionDate;
    self.lastSessionDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastSessionDateLabel.adjustsFontSizeToFitWidth = YES;
    
    self.viewClientLabel = [UILabel new];
    [self.viewClientLabel setFrame:CGRectZero];
    [self.viewClientLabel setTextColor:[UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f]];
    [self.viewClientLabel setTextAlignment:NSTextAlignmentRight];
    //    [self.viewClientLabel setBackgroundColor:[UIColor purpleColor]];
    [self.viewClientLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [self.viewClientLabel setNumberOfLines:1];
    [self.viewClientLabel setHidden:NO];
    self.viewClientLabel.text = @">";
    self.viewClientLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.viewClientLabel.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.profileImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.lastSessionDateLabel];
    [self addSubview:self.viewClientLabel];
    
    [self setupConstraintsForCellView];
}

- (void)setupConstraintsForCellView {
    
    NSLayoutConstraint *profileImageCenterYConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.profileImageView attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual toItem:self
                                                         attribute:NSLayoutAttributeTop multiplier:1.0 constant:5];
    
    NSLayoutConstraint *profileImageCenterXConstraint  = [NSLayoutConstraint
                                                          constraintWithItem:self.profileImageView attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual toItem:self
                                                          attribute:NSLayoutAttributeCenterX multiplier:0.25 constant:0];
    
    NSLayoutConstraint *profileImageWidthConstraint  = [NSLayoutConstraint
                                                        constraintWithItem:self.profileImageView attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual toItem:self
                                                        attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0];
    
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
                                                  attribute:NSLayoutAttributeTop multiplier:1 constant:5];
    
    NSLayoutConstraint *nameLabelHeightConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual toItem:self
                                                     attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0];
    NSLayoutConstraint *nameLabelWidthConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.nameLabel attribute:NSLayoutAttributeWidth
                                                    relatedBy:NSLayoutRelationEqual toItem:self
                                                    attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    
    NSLayoutConstraint *lastSessionDateLabelLeftConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.lastSessionDateLabel attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *lastSessionDateLabelTopConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.lastSessionDateLabel attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual toItem:self.nameLabel
                                                    attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *lastSessionDateLabelHeightConstraint = [NSLayoutConstraint
                                                       constraintWithItem:self.lastSessionDateLabel attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual toItem:self
                                                       attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *lastSessionDateLabelWidthConstraint = [NSLayoutConstraint
                                                      constraintWithItem:self.lastSessionDateLabel attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual toItem:self
                                                      attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    NSLayoutConstraint *viewClientLabelRightConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.viewClientLabel attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual toItem:self
                                                         attribute:NSLayoutAttributeRight multiplier:1 constant:-15];
    NSLayoutConstraint *viewClientLabelCenterYConstraint = [NSLayoutConstraint
                                                           constraintWithItem:self.viewClientLabel attribute:NSLayoutAttributeCenterY
                                                           relatedBy:NSLayoutRelationEqual toItem:self
                                                           attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    NSLayoutConstraint *viewClientLabelHeightConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.viewClientLabel attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual toItem:self
                                                          attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *viewClientLabelWidthConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.viewClientLabel attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual toItem:self
                                                         attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    [self addConstraints:@[profileImageCenterXConstraint, profileImageCenterYConstraint, profileImageHeightConstraint, profileImageWidthConstraint,
                           nameLabelLeftConstraint, nameLabelTopConstraint, nameLabelHeightConstraint, nameLabelWidthConstraint,
                           lastSessionDateLabelLeftConstraint, lastSessionDateLabelTopConstraint, lastSessionDateLabelHeightConstraint, lastSessionDateLabelWidthConstraint,
                           viewClientLabelRightConstraint, viewClientLabelCenterYConstraint, viewClientLabelHeightConstraint, viewClientLabelWidthConstraint]];
}

@end
