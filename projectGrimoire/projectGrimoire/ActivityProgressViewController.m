//
//  ActivityProgressViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/30/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ActivityProgressViewController.h"

@interface ActivityProgressViewController ()

@end

@implementation ActivityProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];
    
    [self setUpNavigationController];
}

- (void) setUpNavigationController {
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setTitle:@"Progress"];
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
