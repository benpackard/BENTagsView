//
//  BENAppDelegate.m
//  BENTagsView
//
//  Created by Ben Packard on 3/13/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENAppDelegate.h"

//controllers
#import "BENTagsDemoController.h"

@implementation BENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	BENTagsDemoController *controller = [[BENTagsDemoController alloc] initWithNibName:nil bundle:nil];
	self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
