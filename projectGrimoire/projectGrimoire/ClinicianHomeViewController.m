//
//  ClinicianHomeViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/30/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ClinicianHomeViewController.h"
#import "ClientInfoViewController.h"
#import "CreatecontentViewController.h"

typedef enum: NSInteger {
    ClientListView = 0,
    ContentCreateView
} viewTags;

@interface ClinicianHomeViewController () <UITabBarControllerDelegate>

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) ClientInfoViewController *clientInfoViewController;
@property (strong, nonatomic) CreatecontentViewController *createcontentViewController;

@end

@implementation ClinicianHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];
}

- (void)initTabController {
    self.tabBarController = [[UITabBarController alloc] init];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName: [UIColor lightGrayColor],}
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f],}
                                             forState:UIControlStateSelected];
    
    self.clientInfoViewController = [[ClientInfoViewController alloc] init];
    self.createcontentViewController = [[CreatecontentViewController alloc] init];
    
    UIImage *activityListImage = [UIImage imageNamed:@"ActivityNormal"];
    UIImage *activityListImageSelected = [UIImage imageNamed:@"ActivitySelected"];
    activityListImage = [activityListImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    activityListImageSelected = [activityListImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.clientInfoViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Clients" image:activityListImage selectedImage:activityListImageSelected];
    
    UIImage *activityProgressImage = [UIImage imageNamed:@"ProgressNormal"];
    UIImage *activityProgressImageSelected = [UIImage imageNamed:@"ProgressSelected"];
    activityProgressImage = [activityProgressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    activityProgressImageSelected = [activityProgressImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.createcontentViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Create" image:activityProgressImage selectedImage:activityProgressImageSelected];
    
    UINavigationController *activityListNavigationController = [[UINavigationController alloc] initWithRootViewController:self.clientInfoViewController];
    UINavigationController *activityProgressNavigationController = [[UINavigationController alloc] initWithRootViewController:self.createcontentViewController];
    
    activityListNavigationController.view.tag = ClientListView;
    activityProgressNavigationController.view.tag = ContentCreateView;
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIFont fontWithName:@"Helvetica-Bold" size:20.0], NSFontAttributeName,
                                               [UIColor whiteColor],NSForegroundColorAttributeName,
                                               nil];
    activityListNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f];//#2f6d99
    activityListNavigationController.navigationBar.titleTextAttributes = navbarTitleTextAttributes;
    activityProgressNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f];//#2f6d99
    activityProgressNavigationController.navigationBar.titleTextAttributes = navbarTitleTextAttributes;
    
    NSArray *myViewControllers = [[NSArray alloc] initWithObjects:activityListNavigationController,activityProgressNavigationController,nil];
    
    [self.tabBarController setViewControllers:myViewControllers animated:YES];
    [self.tabBarController setSelectedIndex:0];
    
    self.tabBarController.delegate = self;
    
    [self.view addSubview:self.tabBarController.view];
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
