//
//  ActivityProgressData.h
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityProgressData : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *dateCompleted;
@property (nonatomic, assign) BOOL isScored;

@end
