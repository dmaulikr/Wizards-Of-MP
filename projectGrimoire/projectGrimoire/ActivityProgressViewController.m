//
//  ActivityProgressViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/30/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ActivityProgressViewController.h"
#import "ActivityProgressData.h"
#import "ActivityProgressCell.h"

@interface ActivityProgressViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView* progressTable;
@property (nonatomic, strong) NSArray *tableData;

@end

static NSString * const activityProgresCellIdentifier = @"activityProgresCellIdentifier";

@implementation ActivityProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];
    
    self.progressTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.progressTable setBackgroundColor:[UIColor clearColor]];
    self.progressTable.scrollsToTop = NO;
    self.progressTable.delegate = self;
    self.progressTable.dataSource = self;
    self.progressTable.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.progressTable.separatorColor = [UIColor darkGrayColor];
    self.progressTable.tableFooterView = [UIView new];
    self.progressTable.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.progressTable];
    
    self.tableData = [self getDummyData];
    
    [self setUpNavigationController];
    [self setupConstraintsForProgressView];
}

- (void) setUpNavigationController {
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setTitle:@"Progress"];
    self.navigationController.toolbarHidden = YES;
}

- (NSMutableArray *)getDummyData {
    NSMutableArray *dummyData = [NSMutableArray new];
    
    ActivityProgressData *d1 = [[ActivityProgressData alloc] init];
    [d1 setName:@"Repeat The Words"];
    [d1 setDateCompleted:@"Completed:3-31-2016"];
    [d1 setStatus:@"Completed"];
    
    ActivityProgressData *d2 = [[ActivityProgressData alloc] init];
    [d2 setName:@"Repeat The Words"];
    [d2 setDateCompleted:@"Completed:3-31-2016"];
    [d2 setStatus:@"Completed"];
    
    ActivityProgressData *d3 = [[ActivityProgressData alloc] init];
    [d3 setName:@"Repeat The Words"];
    [d3 setDateCompleted:@"Completed:3-31-2016"];
    [d3 setStatus:@"Completed"];
    
    ActivityProgressData *d4 = [[ActivityProgressData alloc] init];
    [d4 setName:@"Repeat The Words"];
    [d4 setDateCompleted:@"Completed:3-31-2016"];
    [d4 setStatus:@"Completed"];
    
    ActivityProgressData *d5 = [[ActivityProgressData alloc] init];
    [d5 setName:@"Repeat The Words"];
    [d5 setDateCompleted:@"Completed:3-31-2016"];
    [d5 setStatus:@"Completed"];
    
    [dummyData addObject:d1];
    [dummyData addObject:d2];
    [dummyData addObject:d3];
    [dummyData addObject:d4];
    [dummyData addObject:d5];
    
    return dummyData;
}

- (void)setupConstraintsForProgressView {
    
    id views = @{@"tableView":self.progressTable
                 };
    
    id metrics = @{@"topMargin":@80,
                   @"bottomMargin":@80,
                   @"labelheight":@60,
                   @"leftMargin":@40,
                   @"rightMargin":@40,
                   @"rowSpacing":@20,
                   @"doubleRowSpacing":@40,
                   @"tripleRowSpacing":@60,
                   @"padding":@5,
                   @"imageLabelSpacing":@0
                   };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:metrics views:views]];
    
    NSLayoutConstraint *tableViewCenterXConstraint = [NSLayoutConstraint
                                                      constraintWithItem:self.progressTable attribute:NSLayoutAttributeCenterX
                                                      relatedBy:NSLayoutRelationEqual toItem:self.view
                                                      attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *tableViewHeightConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.progressTable attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual toItem:self.view
                                                     attribute:NSLayoutAttributeHeight multiplier:0.9 constant:0];
    NSLayoutConstraint *tableViewWidthConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.progressTable attribute:NSLayoutAttributeWidth
                                                    relatedBy:NSLayoutRelationEqual toItem:self.view
                                                    attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
//    NSLayoutConstraint *homeButtonTopConstraint = [NSLayoutConstraint
//                                                   constraintWithItem:self.homeButton attribute:NSLayoutAttributeTop
//                                                   relatedBy:NSLayoutRelationEqual toItem:self.footerView
//                                                   attribute:NSLayoutAttributeTop multiplier:1 constant:10];
//    NSLayoutConstraint *homeButtonLeftConstraint = [NSLayoutConstraint
//                                                    constraintWithItem:self.homeButton attribute:NSLayoutAttributeLeft
//                                                    relatedBy:NSLayoutRelationEqual toItem:self.footerView
//                                                    attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
//    
//    NSLayoutConstraint *homeButtonHeightConstraint = [NSLayoutConstraint
//                                                      constraintWithItem:self.homeButton attribute:NSLayoutAttributeHeight
//                                                      relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                      attribute:NSLayoutAttributeHeight multiplier:0.08 constant:0];
//    NSLayoutConstraint *homeButtonWidthConstraint = [NSLayoutConstraint
//                                                     constraintWithItem:self.homeButton attribute:NSLayoutAttributeWidth
//                                                     relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                     attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0];
    
    [self.view addConstraints:@[tableViewCenterXConstraint, tableViewHeightConstraint, tableViewWidthConstraint,
                                /*homeButtonLeftConstraint, homeButtonTopConstraint, homeButtonHeightConstraint, homeButtonWidthConstraint*/]];
}

#pragma mark - UITableViewDataSource Methods

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActivityProgressCell *cell = (ActivityProgressCell *)[self.progressTable dequeueReusableCellWithIdentifier:activityProgresCellIdentifier];
    
    if(cell == nil) {
        cell = [[ActivityProgressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:activityProgresCellIdentifier withProgressData:[self.tableData objectAtIndex:indexPath.row]];
    }
    
    if(indexPath.row == 0 || indexPath.row == 2) {
        [cell.viewScoreLabel setHidden:NO];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectZero];
    footerView.backgroundColor = [UIColor clearColor];
    
    return footerView;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0 || indexPath.row == 2) {
    }
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
