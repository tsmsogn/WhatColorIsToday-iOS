//
//  SignInViewController.h
//  WhatColorIsToday
//
//  Created by tsmsogn on 2014/02/24.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

#import <Parse/Parse.h> // TODO
#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;
- (IBAction)signUpButtonPressed:(id)sender;
- (IBAction)signInButtonPressed:(id)sender;
- (NSString*)getUsername;
- (NSString*)getPassword;
- (IBAction)facebooButtonPressed:(id)sender;
- (IBAction)twitterButtonPressed:(id)sender;

@end
