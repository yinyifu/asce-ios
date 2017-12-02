//
//  AppDelegate.m
//  TimelinesObjC
//
//  Created by Twitter on 5/26/15.
//  Copyright (c) 2015 Twitter. All rights reserved.
//

#import "AppDelegate.h"
#import <TwitterKit/TwitterKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSMutableDictionary *twitterKeys;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Twitter" ofType:@"plist"];
    
    twitterKeys = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    
    [[Twitter sharedInstance] startWithConsumerKey:[twitterKeys objectForKey:@"consumer_key"] consumerSecret:[twitterKeys objectForKey:@"consumer_secret"]];

    return YES;
}

@end
