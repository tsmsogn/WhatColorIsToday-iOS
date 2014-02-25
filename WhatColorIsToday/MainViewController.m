//
//  MixiSampleViewController.m
//  WhatColorIsToday
//
//  Created by tsmsogn on 2014/02/24.
//  Copyright (c) 2014年 tsmsogn. All rights reserved.
//

#import <Parse/Parse.h>
#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view from its nib.
}

- (void) viewDidAppear:(BOOL)animated
{
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        PFObject *posts = [[PFObject alloc] initWithClassName:@"Posts"];
    } else {
        NSLog(@"Redirect to Login View");
        SignInViewController *signInViewController = [[SignInViewController alloc] init];
        [self presentViewController:signInViewController animated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOutButtonPressed:(id)sender {
    NSLog(@"signOutButtonPressed");
    [PFUser logOut];
    [self dismissViewControllerAnimated:NO completion:nil];
    MainViewController *mainViewController = [[MainViewController alloc] init];
    [self presentViewController:mainViewController animated:NO completion:nil];
}
@end
