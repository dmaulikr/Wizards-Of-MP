//
//  LoginViewController.m
//  projectGrimoire
//
//  Created by Prayaas Jain on 3/30/16.
//  Copyright © 2016 Prayaas Jain. All rights reserved.
//

#import "LoginViewController.h"
#import "ClinicianHomeViewController.h"
#import "ClientHomeViewController.h"
#import "ClientInfoViewController.h"

typedef enum : NSInteger {
    UsernameLabelTag = 0,
    PasswordLabelTag,
} Tags;

@interface LoginViewController () <UITextFieldDelegate> {
    NSLayoutConstraint *usernameTextFieldCenterYConstraint;
    NSLayoutConstraint *passwordTextFieldCenterYConstraint;
    NSLayoutConstraint *logInButtonCenterYConstraint;
}

@property (nonatomic, strong) UILabel *appTitleLabel;
@property (strong, nonatomic) UIButton *logInButton;
@property (strong, nonatomic) UITextField *usernametextField;
@property (strong, nonatomic) UITextField *passwordtextField;

@end

static NSString *const usernamePlaceholder = @"Username";
static NSString *const passwordPlaceholder = @"Password";
static NSString *const clinicianUser = @"clinician";
static NSString *const clinicianPass = @"clinic1";
static NSString *const clientUser = @"johnp";
static NSString *const clientPass = @"client1";

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBackground"]]];
    
    [self setupLoginView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)setupLoginView {
    
    self.appTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.appTitleLabel setText:@"TheraPal"];
    [self.appTitleLabel setTextColor:[UIColor whiteColor]];
    [self.appTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.appTitleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:100]];
    [self.appTitleLabel setAlpha:1.0];
    [self.appTitleLabel setNumberOfLines:0];
    self.appTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.appTitleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.usernametextField = [[UITextField alloc] init];
    self.usernametextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.usernametextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.usernametextField setBackgroundColor:[UIColor whiteColor]];
    [self setTextFieldProperties:self.usernametextField withPlaceholder:usernamePlaceholder withTag:UsernameLabelTag];
    
    self.passwordtextField = [[UITextField alloc] init];
    self.passwordtextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordtextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.passwordtextField setBackgroundColor:[UIColor whiteColor]];
    [self setTextFieldProperties:self.passwordtextField withPlaceholder:passwordPlaceholder withTag:PasswordLabelTag];
    
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.logInButton addTarget:self
                          action:@selector(logInButtonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.logInButton setTitle:@"Log In" forState:UIControlStateNormal];
    self.logInButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.logInButton setEnabled:YES];
    [self.logInButton setBackgroundColor:[UIColor clearColor]];
    [self.logInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logInButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.logInButton setAlpha:1.0];
    [[self.logInButton layer] setBorderWidth:1.5f];
    [[self.logInButton layer] setBorderColor:[UIColor whiteColor].CGColor];
    self.logInButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.appTitleLabel];
    [self.view addSubview:self.usernametextField];
    [self.view addSubview:self.passwordtextField];
    [self.view addSubview:self.logInButton];
    
    [self setupLogInViewConstraints];
}

- (void)setupLogInViewConstraints {
    
    NSLayoutConstraint *appTitleLabelCenterXConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.appTitleLabel attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *appTitleLabelCenterYConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.appTitleLabel attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY multiplier:0.4 constant:0];
    
    NSLayoutConstraint *appTitleLabelHeightConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.appTitleLabel attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual toItem:self.view
                                                         attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0];
    NSLayoutConstraint *appTitleLabelWidthConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.appTitleLabel attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual toItem:self.view
                                                        attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0];
    
    NSLayoutConstraint *usernameTextFieldCenterXConstraint = [NSLayoutConstraint
                                                            constraintWithItem:self.usernametextField attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual toItem:self.view
                                                            attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    usernameTextFieldCenterYConstraint = [NSLayoutConstraint
                                        constraintWithItem:self.usernametextField attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual toItem:self.view
                                        attribute:NSLayoutAttributeCenterY multiplier:0.95 constant:0];
    
    NSLayoutConstraint *usernameTextFieldHeightConstraint = [NSLayoutConstraint
                                                           constraintWithItem:self.usernametextField attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual toItem:self.view
                                                           attribute:NSLayoutAttributeHeight multiplier:0.06 constant:0];
    NSLayoutConstraint *usernameTextFieldWidthConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.usernametextField attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual toItem:self.view
                                                          attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0];
    
    NSLayoutConstraint *passwordTextFieldCenterXConstraint = [NSLayoutConstraint
                                                              constraintWithItem:self.passwordtextField attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual toItem:self.view
                                                              attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    passwordTextFieldCenterYConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.passwordtextField attribute:NSLayoutAttributeCenterY
                                          relatedBy:NSLayoutRelationEqual toItem:self.view
                                          attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0];
    
    NSLayoutConstraint *passwordTextFieldHeightConstraint = [NSLayoutConstraint
                                                             constraintWithItem:self.passwordtextField attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual toItem:self.view
                                                             attribute:NSLayoutAttributeHeight multiplier:0.06 constant:0];
    NSLayoutConstraint *passwordTextFieldWidthConstraint = [NSLayoutConstraint
                                                            constraintWithItem:self.passwordtextField attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual toItem:self.view
                                                            attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0];
    
    NSLayoutConstraint *logInButtonCenterXConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.logInButton attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    logInButtonCenterYConstraint = [NSLayoutConstraint
                                     constraintWithItem:self.logInButton attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual toItem:self.view
                                     attribute:NSLayoutAttributeCenterY multiplier:1.25 constant:0];
    
    NSLayoutConstraint *logInButtonHeightConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.logInButton attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual toItem:self.view
                                                        attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0];
    NSLayoutConstraint *logInButtonWidthConstraint = [NSLayoutConstraint
                                                       constraintWithItem:self.logInButton attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual toItem:self.view
                                                       attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
    
    [self.view addConstraints:@[appTitleLabelCenterXConstraint,appTitleLabelCenterYConstraint,appTitleLabelHeightConstraint,appTitleLabelWidthConstraint,
                                usernameTextFieldCenterXConstraint,usernameTextFieldCenterYConstraint,usernameTextFieldHeightConstraint,usernameTextFieldWidthConstraint,
                                passwordTextFieldCenterXConstraint,passwordTextFieldCenterYConstraint,passwordTextFieldHeightConstraint,passwordTextFieldWidthConstraint,
                                logInButtonCenterXConstraint,logInButtonCenterYConstraint,logInButtonHeightConstraint,logInButtonWidthConstraint]];
    
}

- (void)setTextFieldProperties:(UITextField *)inputField withPlaceholder:(NSString*)placeholder withTag:(NSInteger)tag {
    inputField.text = placeholder;
    inputField.textColor = [UIColor lightGrayColor];
    inputField.font = [UIFont fontWithName:@"Helvetica-LightOblique" size:18.0f];
    inputField.textAlignment = NSTextAlignmentCenter;
    inputField.translatesAutoresizingMaskIntoConstraints = NO;
    inputField.layer.cornerRadius = 0;
    inputField.clipsToBounds = YES;
    inputField.tag = tag;
    inputField.delegate = self;
    [inputField setReturnKeyType:UIReturnKeyDone];
    [inputField setKeyboardAppearance:UIKeyboardAppearanceLight];
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if([string isEqualToString:@"\n"]) {
        if(textField == self.passwordtextField) {
            [textField resignFirstResponder];
            [self logInButtonPressed:nil];
        }
        
        if(textField == self.usernametextField) {
            [self.passwordtextField becomeFirstResponder];
        }
        return NO;
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if([textField.text isEqualToString:usernamePlaceholder]) {
        textField.text = @"";
        textField.textColor = [UIColor blackColor];
    }
    else if([textField.text isEqualToString:passwordPlaceholder]) {
        textField.secureTextEntry = YES;
        textField.text = @"";
        textField.textColor = [UIColor blackColor];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if ([textField.text isEqualToString:@""]) {
        if(textField.tag == UsernameLabelTag) {
            textField.text = usernamePlaceholder;
            textField.textColor = [UIColor grayColor];
        }
        else if(textField.tag == PasswordLabelTag) {
            textField.secureTextEntry = NO;
            textField.text = passwordPlaceholder;
            textField.textColor = [UIColor grayColor];
        }
        [textField resignFirstResponder];
    }
}

#pragma mark - Responding to keyboard events
- (void)adjustViewByKeyboardState:(BOOL)showKeyboard keyboardInfo:(NSDictionary *)info {
    
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    
    // transform the UIViewAnimationCurve to a UIViewAnimationOptions mask
    UIViewAnimationCurve animationCurve = [info[UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    if (animationCurve == UIViewAnimationCurveEaseIn) {
        animationOptions |= UIViewAnimationOptionCurveEaseIn;
    }
    else if (animationCurve == UIViewAnimationCurveEaseInOut) {
        animationOptions |= UIViewAnimationOptionCurveEaseInOut;
    }
    else if (animationCurve == UIViewAnimationCurveEaseOut) {
        animationOptions |= UIViewAnimationOptionCurveEaseOut;
    }
    else if (animationCurve == UIViewAnimationCurveLinear) {
        animationOptions |= UIViewAnimationOptionCurveLinear;
    }
    
    if (showKeyboard) {
        usernameTextFieldCenterYConstraint.constant = -100;
        passwordTextFieldCenterYConstraint.constant = -100;
        logInButtonCenterYConstraint.constant = -100;
        
    }
    else {
        usernameTextFieldCenterYConstraint.constant = 0;
        passwordTextFieldCenterYConstraint.constant = 0;
        logInButtonCenterYConstraint.constant = 0;
    }
    
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    
    NSDictionary *userInfo = [notification userInfo];
    [self adjustViewByKeyboardState:YES keyboardInfo:userInfo];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    NSDictionary *userInfo = [notification userInfo];
    [self adjustViewByKeyboardState:NO keyboardInfo:userInfo];
}

- (void)dismissKeyboard {
    [self.usernametextField resignFirstResponder];
    [self.passwordtextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)showErrorMsg:(NSString *)title withMsg:(NSString *)msg withButtonLabel:(NSString *)buttonLabel {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:buttonLabel
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }
                                    ];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)logInButtonPressed:(id)sender {
    if([self.usernametextField.text isEqualToString:clinicianUser] && [self.passwordtextField.text isEqualToString:clinicianPass]) {
        ClinicianHomeViewController *chvc = [[ClinicianHomeViewController alloc] init];
        [chvc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:chvc animated:YES completion:nil];
    }
    else if([self.usernametextField.text isEqualToString:clientUser] && [self.passwordtextField.text isEqualToString:clientPass]) {
        ClientHomeViewController *chvc = [[ClientHomeViewController alloc] init];
        [chvc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:chvc animated:YES completion:nil];
    }
    else {
        [self showErrorMsg:nil withMsg:@"Incorrect Username or Password. Please try again." withButtonLabel:@"Ok"];
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
