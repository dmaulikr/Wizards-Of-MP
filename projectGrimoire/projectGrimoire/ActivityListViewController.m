//
//  ActivityListViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/30/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "ActivityListViewController.h"
#import "ActivityCardViewCell.h"
#import "ActivityCardView.h"
#import "DateLineView.h"

@interface ActivityListViewController () {
    float cardWidth;
    float cardHeight;
    float dateLineHeight;
    float scrollY;
}

@property (strong, nonatomic) UIScrollView *scrollView;

@end

static float cardX = 20;
static float CARD_DATE_SPACING = 30;
static float DATE_CARD_SPACING = 10;

@implementation ActivityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithRed:220/255.0f green:222/255.0f blue:227/255.0f alpha:1.0]];
    
    [self setUpNavigationController];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0 + self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    
    cardWidth = self.view.frame.size.width-40;
    cardHeight = self.view.frame.size.height/5;
    dateLineHeight = 20;
    scrollY = 20;
}

- (void)viewDidLayoutSubviews {
    [self.view addSubview:self.scrollView];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.5)];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
    
    [self populateCards];
}

- (void)setUpNavigationController {
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setTitle:@"Activities"];
    self.navigationController.toolbarHidden = YES;
    
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
    [addBarButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = addBarButton;
}

- (void)populateCards {
    
    scrollY += CARD_DATE_SPACING;
    
    UILabel *date1 = [[UILabel alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, dateLineHeight)];
    [date1 setText:@"Friday, April 1"];
    [date1 setTextColor:[UIColor darkGrayColor]];
    [date1 setTextAlignment:NSTextAlignmentCenter];
    [date1 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0]];
    
    scrollY += dateLineHeight + DATE_CARD_SPACING;
    
    ActivityCardView *card1 = [[ActivityCardView alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, cardHeight)];
    [card1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SalmonBG"]]];
    card1.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, card1.frame.size.width-20, card1.frame.size.height/3-10)];
    card1.nameLabel.text = @"Repeat the Words";
    card1.nameLabel.textColor = [UIColor whiteColor];
    card1.nameLabel.textAlignment = NSTextAlignmentLeft;
    card1.nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22.0];
    card1.estimatedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(card1.nameLabel.frame.origin.x, card1.nameLabel.frame.size.height+10+60, card1.nameLabel.frame.size.width, card1.nameLabel.frame.size.height/2)];
    card1.estimatedTimeLabel.text = @"Estimated Time: 10 mins";
    card1.estimatedTimeLabel.textColor = [UIColor whiteColor];
    card1.estimatedTimeLabel.textAlignment = NSTextAlignmentRight;
    card1.estimatedTimeLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
    [card1 addSubview:card1.nameLabel];
    [card1 addSubview:card1.estimatedTimeLabel];
    
    scrollY += cardHeight + CARD_DATE_SPACING;
    
    UILabel *date2 = [[UILabel alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, dateLineHeight)];
    [date2 setText:@"Saturday, April 2"];
    [date2 setTextColor:[UIColor darkGrayColor]];
    [date2 setTextAlignment:NSTextAlignmentCenter];
    [date2 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0]];
    
    scrollY += dateLineHeight + DATE_CARD_SPACING;
    
    ActivityCardView *card2 = [[ActivityCardView alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, cardHeight)];
    [card2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SeaGreenBG"]]];
    card2.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, card2.frame.size.width-20, card2.frame.size.height/3-10)];
    card2.nameLabel.text = @"Sock Game";
    card2.nameLabel.textColor = [UIColor whiteColor];
    card2.nameLabel.textAlignment = NSTextAlignmentLeft;
    card2.nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22.0];
    card2.estimatedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(card2.nameLabel.frame.origin.x, card2.nameLabel.frame.size.height+10+60, card2.nameLabel.frame.size.width, card2.nameLabel.frame.size.height/2)];
    card2.estimatedTimeLabel.text = @"Estimated Time: 8 mins";
    card2.estimatedTimeLabel.textColor = [UIColor whiteColor];
    card2.estimatedTimeLabel.textAlignment = NSTextAlignmentRight;
    card2.estimatedTimeLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
    [card2 addSubview:card2.nameLabel];
    [card2 addSubview:card2.estimatedTimeLabel];
    
    scrollY += cardHeight + CARD_DATE_SPACING;
    
    UILabel *date3 = [[UILabel alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, dateLineHeight)];
    [date3 setText:@"Sunday, April 3"];
    [date3 setTextColor:[UIColor darkGrayColor]];
    [date3 setTextAlignment:NSTextAlignmentCenter];
    [date3 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0]];
    
    scrollY += dateLineHeight + DATE_CARD_SPACING;
    
    ActivityCardView *card3 = [[ActivityCardView alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, cardHeight)];
    [card3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SeaGreenBG"]]];
    card3.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, card3.frame.size.width-20, card3.frame.size.height/3-10)];
    card3.nameLabel.text = @"Rhyming Words";
    card3.nameLabel.textColor = [UIColor whiteColor];
    card3.nameLabel.textAlignment = NSTextAlignmentLeft;
    card3.nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22.0];
    card3.estimatedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(card3.nameLabel.frame.origin.x, card3.nameLabel.frame.size.height+10+60, card3.nameLabel.frame.size.width, card3.nameLabel.frame.size.height/2)];
    card3.estimatedTimeLabel.text = @"Estimated Time: 15 mins";
    card3.estimatedTimeLabel.textColor = [UIColor whiteColor];
    card3.estimatedTimeLabel.textAlignment = NSTextAlignmentRight;
    card3.estimatedTimeLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
    [card3 addSubview:card3.nameLabel];
    [card3 addSubview:card3.estimatedTimeLabel];
    
    scrollY += cardHeight + CARD_DATE_SPACING;
    
    UILabel *date4 = [[UILabel alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, dateLineHeight)];
    [date4 setText:@"Monday, April 5"];
    [date4 setTextColor:[UIColor darkGrayColor]];
    [date4 setTextAlignment:NSTextAlignmentCenter];
    [date4 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0]];
    
    scrollY += dateLineHeight + DATE_CARD_SPACING;
    
    ActivityCardView *card4 = [[ActivityCardView alloc] initWithFrame:CGRectMake(cardX, scrollY, cardWidth, cardHeight)];
    [card4 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SeaGreenBG"]]];
    card4.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, card4.frame.size.width-20, card4.frame.size.height/3-10)];
    card4.nameLabel.text = @"Identify the Sound";
    card4.nameLabel.textColor = [UIColor whiteColor];
    card4.nameLabel.textAlignment = NSTextAlignmentLeft;
    card4.nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22.0];
    card4.estimatedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(card4.nameLabel.frame.origin.x, card4.nameLabel.frame.size.height+10+60, card4.nameLabel.frame.size.width, card4.nameLabel.frame.size.height/2)];
    card4.estimatedTimeLabel.text = @"Estimated Time: 6 mins";
    card4.estimatedTimeLabel.textColor = [UIColor whiteColor];
    card4.estimatedTimeLabel.textAlignment = NSTextAlignmentRight;
    card4.estimatedTimeLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
    [card4 addSubview:card4.nameLabel];
    [card4 addSubview:card4.estimatedTimeLabel];
    
    scrollY += cardHeight + CARD_DATE_SPACING;
    
    [self.scrollView addSubview:date1];
    [self.scrollView addSubview:card1];
    [self.scrollView addSubview:date2];
    [self.scrollView addSubview:card2];
    [self.scrollView addSubview:date3];
    [self.scrollView addSubview:card3];
    [self.scrollView addSubview:date4];
    [self.scrollView addSubview:card4];
    
}

- (IBAction)addButtonPressed:(id)sender {
    
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
