//
//  UpdatesViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "UpdatesViewController.h"
#import "UpdateData.h"
#import "UpdateCell.h"

@interface UpdatesViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView* updatesTable;
@property (nonatomic, strong) NSArray *tableData;

@end

static NSString * const updateInfoCellIdentifier = @"updateInfoCellIdentifier";

@implementation UpdatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];

    self.updatesTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.updatesTable setBackgroundColor:[UIColor clearColor]];
    self.updatesTable.scrollsToTop = NO;
    self.updatesTable.delegate = self;
    self.updatesTable.dataSource = self;
    self.updatesTable.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.updatesTable.separatorColor = [UIColor clearColor];
    self.updatesTable.tableFooterView = [UIView new];
    self.updatesTable.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.updatesTable];
    
    self.tableData = [self getDummyData];
    
    [self setUpNavigationController];
    [self setupConstraintsForUpdatesView];
}

- (void) setUpNavigationController {
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setTitle:@"Updates"];
    self.navigationController.toolbarHidden = YES;
}

- (NSMutableArray *)getDummyData {
    NSMutableArray *dummyData = [NSMutableArray new];
    
    UpdateData *d1 = [[UpdateData alloc] init];
    [d1 setProfileImageName:@"clientDefault"];
    [d1 setName:@"Client 000123"];
    [d1 setLastActivity:@"Last Activity: Rhyming Words"];
    [d1 setCompleteDate:@"Completed: 3-31-2016"];
    
    UpdateData *d2 = [[UpdateData alloc] init];
    [d2 setProfileImageName:@"client2"];
    [d2 setName:@"Client 000124"];
    [d2 setLastActivity:@"Last Activity: Repeaet the Words"];
    [d2 setCompleteDate:@"Completed: 3-30-2016"];
    
    UpdateData *d3 = [[UpdateData alloc] init];
    [d3 setProfileImageName:@"client1"];
    [d3 setName:@"Client 001245"];
    [d3 setLastActivity:@"Last Activity: Mirror Practice"];
    [d3 setCompleteDate:@"Completed: 3-28-2016"];
    
    UpdateData *d4 = [[UpdateData alloc] init];
    [d4 setProfileImageName:@"clientDefault"];
    [d4 setName:@"Client 001246"];
    [d4 setLastActivity:@"Last Activity: Rhyming Words"];
    [d4 setCompleteDate:@"Completed: 3-31-2016"];
    
    UpdateData *d5 = [[UpdateData alloc] init];
    [d5 setProfileImageName:@"client3"];
    [d5 setName:@"Client 001247"];
    [d5 setLastActivity:@"Last Activity: Sock Game"];
    [d5 setCompleteDate:@"Completed: 3-25-2016"];
    
    [dummyData addObject:d1];
    [dummyData addObject:d2];
    [dummyData addObject:d3];
    [dummyData addObject:d4];
    [dummyData addObject:d5];
    
    return dummyData;
}

- (void)setupConstraintsForUpdatesView {
    
    id views = @{@"tableView":self.updatesTable
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
                                                      constraintWithItem:self.updatesTable attribute:NSLayoutAttributeCenterX
                                                      relatedBy:NSLayoutRelationEqual toItem:self.view
                                                      attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *tableViewHeightConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.updatesTable attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual toItem:self.view
                                                     attribute:NSLayoutAttributeHeight multiplier:0.9 constant:0];
    NSLayoutConstraint *tableViewWidthConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.updatesTable attribute:NSLayoutAttributeWidth
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
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UpdateCell *cell = (UpdateCell *)[self.updatesTable dequeueReusableCellWithIdentifier:updateInfoCellIdentifier];
    
    if(cell == nil) {
        cell = [[UpdateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:updateInfoCellIdentifier withUpdateData:[self.tableData objectAtIndex:indexPath.row]];
    }
    
    if(indexPath.row == 0 || indexPath.row == 2) {
        [cell.profileImageView setHidden:NO];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.borderColor = [UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0].CGColor;
    cell.layer.borderWidth = 5.0;
    
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

@end
