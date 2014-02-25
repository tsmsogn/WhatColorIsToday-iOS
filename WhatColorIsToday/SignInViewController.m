//
//  SignInViewController.m
//  WhatColorIsToday
//
//  Created by tsmsogn on 2014/02/24.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

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
- (IBAction)signUpButtonPressed:(id)sender {
    NSLog(@"signUpButtonPressed");
    NSLog(@"%@", self.getPassword);
    NSLog(@"%@", self.getUsername);
    
    NSString *username = self.getUsername;
    NSString *password = self.getPassword;
    
    PFUser *user = [PFUser user];
    
    user.username = username;
    user.password = password;
    user.email = username;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            NSLog(@"success");
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"fail");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:errorString delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
        }
    }];
}

- (IBAction)signInButtonPressed:(id)sender {
    NSLog(@"signInButtonPressed");
    NSLog(@"%@", self.getPassword);
    NSLog(@"%@", self.getUsername);
    
    NSString *username = self.getUsername;
    NSString *password = self.getPassword;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
        if (user) {
            // Do stuff after successful login.
            NSLog(@"success");            
            [self dismissViewControllerAnimated:NO completion:nil];
        } else {
            // The login failed. Check error to see why.
            NSLog(@"fail");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:error.localizedDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
        }
    }];
}

- (NSString*)getPassword
{
    return self.password.text;
}

- (IBAction)facebooButtonPressed:(id)sender {
    NSLog(@"facebooButtonPressed");
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"" message:@"Uh oh. The user cancelled the Facebook login." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            [self dismissViewControllerAnimated:NO completion:nil];
        } else {
            NSLog(@"User logged in through Facebook!");
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }];
}

- (IBAction)twitterButtonPressed:(id)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Uh oh. The user cancelled the Twitter login." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
            [self dismissViewControllerAnimated:NO completion:nil];
        } else {
            NSLog(@"User logged in with Twitter!");
            [self dismissViewControllerAnimated:NO completion:nil];
        }     
    }];
}

- (NSString*)getUsername
{
    return self.username.text;
}

@end
