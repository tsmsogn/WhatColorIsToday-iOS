//
//  ForgotPasswordViewController.m
//  WhatColorIsToday
//
//  Created by tsmsogn on 2014/02/25.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)getUsername
{
    return self.username.text;
}

- (IBAction)resetButtonPressed:(id)sender {
    NSLog(@"resetButtonPressed");
    NSString *username = self.getUsername;
    
    [PFUser requestPasswordResetForEmail:username];
    
    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"" message:@"An email was successfully sent with reset instructions." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alerView show];
    
    SignInViewController *singInViewController = [[SignInViewController alloc] init];
    [self presentViewController:singInViewController animated:NO completion:nil];
    
}
@end
