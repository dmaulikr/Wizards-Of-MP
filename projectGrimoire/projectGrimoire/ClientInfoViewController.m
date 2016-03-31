//
//  ClientInfoViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/31/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ClientInfoViewController.h"
#import "ClientInfoData.h"
#import "ClientInfoCell.h"

@interface ClientInfoViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView* clientTable;
@property (nonatomic, strong) NSArray *tableData;

@end

static NSString * const ClientInfoCellIdentifier = @"ClientInfoCellIdentifier";

@implementation ClientInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];
    
    self.clientTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.clientTable setBackgroundColor:[UIColor clearColor]];
    self.clientTable.scrollsToTop = NO;
    self.clientTable.delegate = self;
    self.clientTable.dataSource = self;
    self.clientTable.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.clientTable.separatorColor = [UIColor darkGrayColor];
    self.clientTable.tableFooterView = [UIView new];
    self.clientTable.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addSubview:self.clientTable];
    
    self.tableData = [self getDummyData];
    
    [self setUpNavigationController];
    [self setupConstraintsForProgressView];
}

- (void) setUpNavigationController {
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setTitle:@"Clients"];
    self.navigationController.toolbarHidden = YES;
}

- (NSMutableArray *)getDummyData {
    NSMutableArray *dummyData = [NSMutableArray new];
    
    ClientInfoData *d1 = [[ClientInfoData alloc] init];
    [d1 setName:@"Client 000123"];
    [d1 setLastSessionDate:@"Last Session: 3-31-2016"];
   
    
    ClientInfoData *d2 = [[ClientInfoData alloc] init];
    [d2 setName:@"Client 000124"];
    [d2 setLastSessionDate:@"Last Session: 3-30-2016"];
 
    
    ClientInfoData *d3 = [[ClientInfoData alloc] init];
    [d3 setName:@"Client 001245"];
    [d3 setLastSessionDate:@"Last Session: 3-28-2016"];

    
    ClientInfoData *d4 = [[ClientInfoData alloc] init];
    [d4 setName:@"Client 001246"];
    [d4 setLastSessionDate:@"Last Session: 3-31-2016"];

    
    ClientInfoData *d5 = [[ClientInfoData alloc] init];
    [d5 setName:@"Client 001247"];
    [d5 setLastSessionDate:@"Last Session: 3-25-2016"];
   
    
    [dummyData addObject:d1];
    [dummyData addObject:d2];
    [dummyData addObject:d3];
    [dummyData addObject:d4];
    [dummyData addObject:d5];
    
    return dummyData;
}

- (void)setupConstraintsForProgressView {
    
    id views = @{@"tableView":self.clientTable
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
                                                      constraintWithItem:self.clientTable attribute:NSLayoutAttributeCenterX
                                                      relatedBy:NSLayoutRelationEqual toItem:self.view
                                                      attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *tableViewHeightConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.clientTable attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual toItem:self.view
                                                     attribute:NSLayoutAttributeHeight multiplier:0.9 constant:0];
    NSLayoutConstraint *tableViewWidthConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.clientTable attribute:NSLayoutAttributeWidth
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
    
    ClientInfoCell *cell = (ClientInfoCell *)[self.clientTable dequeueReusableCellWithIdentifier:ClientInfoCellIdentifier];
    
    if(cell == nil) {
        cell = [[ClientInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ClientInfoCellIdentifier withClientData:[self.tableData objectAtIndex:indexPath.row]];
    }
    
    if(indexPath.row == 0 || indexPath.row == 2) {
        [cell.profileImageView setHidden:NO];
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
