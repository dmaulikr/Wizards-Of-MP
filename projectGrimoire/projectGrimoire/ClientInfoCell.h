//
//  ClientInfoCell.h
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClientInfoData.h"

@interface ClientInfoCell : UITableViewCell

@property (nonatomic, strong) ClientInfoData *clientData;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *lastSessionDateLabel;
@property (nonatomic, strong) UIImageView *profileImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withProgressData:(ClientInfoData*) clientData;

@end
