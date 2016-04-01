//
//  UpdateCell.h
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateData.h"

@interface UpdateCell : UITableViewCell

@property (nonatomic, strong) UpdateData *updateData;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *completeDateLabel;
@property (nonatomic, strong) UILabel *lastActivityLabel;
@property (nonatomic, strong) UIImageView *profileImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withUpdateData:(UpdateData*)updateData;

@end
