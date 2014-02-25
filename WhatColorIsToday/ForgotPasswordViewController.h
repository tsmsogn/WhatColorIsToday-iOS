//
//  ForgotPasswordViewController.h
//  WhatColorIsToday
//
//  Created by tsmsogn on 2014/02/25.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "SignInViewController.h"

@interface ForgotPasswordViewController : UIViewController
- (NSString*)getUsername;
@property (weak, nonatomic) IBOutlet UITextField *username;
- (IBAction)resetButtonPressed:(id)sender;

@end
