//
//  ClinicianHomeViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/30/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ClinicianHomeViewController.h"
#import "UpdatesViewController.h"
#import "ClientInfoViewController.h"
#import "CreatecontentViewController.h"

typedef enum: NSInteger {
    UpdatesView = 0,
    ClientListView,
    ContentCreateView
} viewTags;

@interface ClinicianHomeViewController () <UITabBarControllerDelegate>

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UpdatesViewController *updatesViewController;
@property (strong, nonatomic) ClientInfoViewController *clientInfoViewController;
@property (strong, nonatomic) CreatecontentViewController *createcontentViewController;

@end

@implementation ClinicianHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];
    
    [self initTabController];
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
    
    self.updatesViewController = [[UpdatesViewController alloc] init];
    self.clientInfoViewController = [[ClientInfoViewController alloc] init];
    self.createcontentViewController = [[CreatecontentViewController alloc] init];
    
    UIImage *updatesImage = [UIImage imageNamed:@"UpdatesNormal"];
    UIImage *updatesImageSelected = [UIImage imageNamed:@"UpdatesSelected"];
    updatesImage = [updatesImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    updatesImageSelected = [updatesImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.updatesViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Updates" image:updatesImage selectedImage:updatesImageSelected];
    
    UIImage *clientsImage = [UIImage imageNamed:@"ClientsNormal"];
    UIImage *clientsImageSelected = [UIImage imageNamed:@"ClientsSelected"];
    clientsImage = [clientsImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    clientsImageSelected = [clientsImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.clientInfoViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Clients" image:clientsImage selectedImage:clientsImageSelected];
    
    UIImage *createImage = [UIImage imageNamed:@"CreateNormal"];
    UIImage *createImageSelected = [UIImage imageNamed:@"CreateSelected"];
    createImage = [createImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    createImageSelected = [createImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.createcontentViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Create" image:createImage selectedImage:createImageSelected];
    
    UINavigationController *updatesNavigationController = [[UINavigationController alloc] initWithRootViewController:self.updatesViewController];
    UINavigationController *clientInfoNavigationController = [[UINavigationController alloc] initWithRootViewController:self.clientInfoViewController];
    UINavigationController *createNavigationController = [[UINavigationController alloc] initWithRootViewController:self.createcontentViewController];
    
    updatesNavigationController.view.tag = UpdatesView;
    clientInfoNavigationController.view.tag = ClientListView;
    createNavigationController.view.tag = ContentCreateView;
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIFont fontWithName:@"Helvetica-Bold" size:20.0], NSFontAttributeName,
                                               [UIColor whiteColor],NSForegroundColorAttributeName,
                                               nil];
    
    updatesNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f];//#2f6d99
    updatesNavigationController.navigationBar.titleTextAttributes = navbarTitleTextAttributes;
    clientInfoNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f];//#2f6d99
    clientInfoNavigationController.navigationBar.titleTextAttributes = navbarTitleTextAttributes;
    createNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:47/255.0f green:109/255.0f blue:153/255.0f alpha:1.0f];//#2f6d99
    createNavigationController.navigationBar.titleTextAttributes = navbarTitleTextAttributes;
    
    NSArray *myViewControllers = [[NSArray alloc] initWithObjects:updatesNavigationController,clientInfoNavigationController,createNavigationController,nil];
    
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
