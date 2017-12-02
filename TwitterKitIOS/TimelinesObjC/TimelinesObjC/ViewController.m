//
//  ViewController.m
//  TimelinesObjC
//
//  Created by Twitter on 5/26/15.
//  Copyright (c) 2015 Twitter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    self.dataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:@"twitterdev" APIClient:client];
}

@end
