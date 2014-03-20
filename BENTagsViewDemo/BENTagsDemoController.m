//
//  BENTagsDemoController.m
//  BENTagsView
//
//  Created by Ben Packard on 3/13/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENTagsDemoController.h"

//views
#import "BENTagsView.h"

@interface BENTagsDemoController ()

@end

@implementation BENTagsDemoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
		
    }
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.9];
	
	UILabel *helpLabel = [[UILabel alloc] init];
	helpLabel.translatesAutoresizingMaskIntoConstraints = NO;
	helpLabel.text = @"Here are some tags.";
	[self.view addSubview:helpLabel];
	
	BENTagsView *tagsView = [[BENTagsView alloc] init];
	tagsView.translatesAutoresizingMaskIntoConstraints = NO;
	tagsView.tagStrings = @[@"tag one", @"tag two", @"tag three"];
	[self.view addSubview:tagsView];
	
	UILabel *helpLabel2 = [[UILabel alloc] init];
	helpLabel2.translatesAutoresizingMaskIntoConstraints = NO;
	helpLabel2.text = @"Tags can be on or off.";
	[self.view addSubview:helpLabel2];
	
	BENTagsView *tagsView2 = [[BENTagsView alloc] init];
	tagsView2.translatesAutoresizingMaskIntoConstraints = NO;
	tagsView2.tagStrings = @[@"on", @"off", @"on"];
	NSMutableIndexSet *onIndexes = [NSMutableIndexSet indexSetWithIndex:0];
	[onIndexes addIndex:2];
	[tagsView2 setOnIndexes:onIndexes];
	[self.view addSubview:tagsView2];
	
	UILabel *helpLabel3 = [[UILabel alloc] init];
	helpLabel3.translatesAutoresizingMaskIntoConstraints = NO;
	helpLabel3.text = @"On and off colors can be customized.";
	helpLabel3.numberOfLines = 0;
	helpLabel3.lineBreakMode = NSLineBreakByWordWrapping;
	[self.view addSubview:helpLabel3];
	
	BENTagsView *tagsView3 = [[BENTagsView alloc] init];
	tagsView3.translatesAutoresizingMaskIntoConstraints = NO;
	tagsView3.tagStrings = tagsView.tagStrings;
	[tagsView3 setOnIndexes:tagsView2.onIndexes];
	[tagsView3 setOnColor:[UIColor greenColor]];
	[tagsView3 setOffColor:[UIColor redColor]];
	[self.view addSubview:tagsView3];
	
	UILabel *helpLabel4 = [[UILabel alloc] init];
	helpLabel4.translatesAutoresizingMaskIntoConstraints = NO;
	helpLabel4.text = @"Fonts, corners, and sizes can be customized.";
	helpLabel4.numberOfLines = 0;
	helpLabel4.lineBreakMode = NSLineBreakByWordWrapping;
	[self.view addSubview:helpLabel4];
	
	BENTagsView *tagsView4 = [[BENTagsView alloc] init];
	tagsView4.translatesAutoresizingMaskIntoConstraints = NO;
	tagsView4.tagStrings = tagsView.tagStrings;
	[tagsView4 setOnIndexes:tagsView2.onIndexes];
	[tagsView4 setFont:[UIFont fontWithName:@"Baskerville-BoldItalic" size:16]];
	[tagsView4 setTagCornerRadius:3];
	[self.view addSubview:tagsView4];

	//layout
	NSDictionary *views = @{@"help":helpLabel, @"tags":tagsView, @"help2":helpLabel2, @"tags2":tagsView2, @"help3":helpLabel3, @"tags3":tagsView3, @"help4":helpLabel4, @"tags4":tagsView4};
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-45-[help]-[tags]-20-[help2]-[tags2]-20-[help3]-[tags3]-20-[help4]-[tags4]"
																	  options:0
																	  metrics:nil
																		views:views]];
	for (UIView *view in @[tagsView, tagsView2, tagsView3, tagsView4])
	{
		[self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
															  attribute:NSLayoutAttributeCenterX
															  relatedBy:NSLayoutRelationEqual
																 toItem:self.view
															  attribute:NSLayoutAttributeCenterX
															 multiplier:1
															   constant:0]];
    }
	for (UIView *view in @[helpLabel, helpLabel2, helpLabel3, helpLabel4])
	{
		[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[view]-|"
																		  options:0
																		  metrics:nil
																			views:NSDictionaryOfVariableBindings(view)]];
    }
}

@end
