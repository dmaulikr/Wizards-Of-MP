//
//  ActivityProgressCell.h
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityProgressData.h"

@interface ActivityProgressCell : UITableViewCell

@property (nonatomic, strong) ActivityProgressData *progressData;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UILabel *completedDateLabel;
@property (nonatomic, strong) UILabel *viewScoreLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withProgressData:(ActivityProgressData*) progressData;

@end
