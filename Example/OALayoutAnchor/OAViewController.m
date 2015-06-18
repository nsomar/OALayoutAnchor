//
//  OAViewController.m
//  OALayoutAnchor
//
//  Created by Omar Abdelhafith on 06/17/2015.
//  Copyright (c) 2014 Omar Abdelhafith. All rights reserved.
//

#import "OAViewController.h"
#import "UIView+OALayoutAnchor.h"


@interface OAViewController ()

@end

@implementation OAViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  UILabel *label1 = [[UILabel alloc] init];
  label1.text = @"Some amazing text";
  label1.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.view addSubview:label1];
  
  UILabel *label2 = [[UILabel alloc] init];
  label2.text = @"Some text";
  label2.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.view addSubview:label2];
  
  UIView *separatorView = [[UIView alloc] init];
  separatorView.backgroundColor = [UIColor grayColor];
  separatorView.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.view addSubview:separatorView];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
  button.translatesAutoresizingMaskIntoConstraints = NO;
  [button setTitle:@"the button" forState:UIControlStateNormal];
  [self.view addSubview:button];
  
  [label1.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
  [label1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
  
  [label2.topAnchor constraintEqualToAnchor:label1.topAnchor constant:0].active = YES;
  [label2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
  
  [separatorView.topAnchor constraintEqualToAnchor:label1.bottomAnchor constant:10].active = YES;
  [separatorView.leadingAnchor constraintEqualToAnchor:label1.leadingAnchor].active = YES;
  [separatorView.trailingAnchor constraintEqualToAnchor:label2.trailingAnchor].active = YES;
  [separatorView.heightAnchor constraintEqualToConstant:10].active = YES;
  
  [button.trailingAnchor constraintEqualToAnchor:separatorView.trailingAnchor].active = YES;
  [button.topAnchor constraintEqualToAnchor:separatorView.bottomAnchor constant:10].active = YES;
}

@end
