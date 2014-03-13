//
//  BENTagsView.m
//
//
//  Created by Ben Packard on 3/12/14.
//
//

#import "BENTagsView.h"

//views
#import "BENTag.h"

@interface BENTagsView ()

@property NSMutableArray *tags;

@end

@implementation BENTagsView

@synthesize tagStrings = _tagStrings;
@synthesize font = _font;
@synthesize textColor = _textColor;
@synthesize onColor = _onColor;
@synthesize offColor = _offColor;
@synthesize onIndexes = _onIndexes;

#pragma mark - initialization

- (void)baseInit
{
	//arrays
	self.onIndexes = [NSIndexSet indexSet];
	self.tags = [NSMutableArray array];
	
	//defaults
	self.onColor = [UIColor blackColor];
	self.offColor = [UIColor colorWithRed:0.79 green:0.79 blue:0.79 alpha:1.0];
	self.font = [UIFont systemFontOfSize:9];
	self.textColor = [UIColor whiteColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		[self baseInit];
    }
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
	{
        [self baseInit];
    }
    return self;
}

#pragma mark - subviews and layout

- (void)refresh
{
	//remove all existing tag views (also removes constraints automatically)
	for (BENTag *tag in self.tags)
	{
		[tag removeFromSuperview];
	}
	[self.tags removeAllObjects];
	
	//add tags
	[self.tagStrings enumerateObjectsUsingBlock:^(id tagString, NSUInteger idx, BOOL *stop) {
		BENTag *tag = [[BENTag alloc] init];
		tag.translatesAutoresizingMaskIntoConstraints = NO;
		tag.textLabel.text = tagString;
		tag.textLabel.font = self.font;
		tag.textLabel.textColor = self.textColor;
		tag.onColor = self.onColor;
		tag.offColor = self.offColor;
		tag.on = [self.onIndexes containsIndex:idx] ? YES : NO;
		[self addSubview:tag];
		[self.tags addObject:tag];
	}];
	
	//layout
	BENTag *previousTag = nil;
	
	for (BENTag *tag in self.tags)
	{
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tag]|"
																	 options:0
																	 metrics:nil
																	   views:NSDictionaryOfVariableBindings(tag)]];

		if (!previousTag)
		{
			[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[tag]"
																		 options:0
																		 metrics:nil
																		   views:NSDictionaryOfVariableBindings(tag)]];
		}
		else
		{
			[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[previousTag]-5-[tag]"
																		 options:0
																		 metrics:nil
																		   views:NSDictionaryOfVariableBindings(previousTag, tag)]];
		}
		
		if (tag == [self.tags lastObject])
		{
			[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[tag]|"
																		 options:0
																		 metrics:nil
																		   views:NSDictionaryOfVariableBindings(tag)]];
		}
		
		previousTag = tag;
	}
}

#pragma mark - custom setters for properties that require a refresh

- (NSArray *)tagStrings
{
	return _tagStrings;
}

- (void)setTagStrings:(NSArray *)tagStrings
{
	if ([tagStrings isEqualToArray:self.tagStrings]) return;
	_tagStrings = tagStrings;
	[self refresh];
}

- (UIFont *)font
{
	return _font;
}

- (void)setFont:(UIFont *)font
{
	if ([font isEqual:self.font]) return;
	_font = font;
	[self refresh];
}

- (UIColor *)textColor
{
	return _textColor;
}

- (void)setTextColor:(UIColor *)textColor
{
	if ([textColor isEqual:self.textColor]) return;
	_textColor = textColor;
	[self refresh];
}

- (UIColor *)onColor
{
	return _onColor;
}

- (void)setOnColor:(UIColor *)onColor
{
	if ([onColor isEqual:self.onColor]) return;
	_onColor = onColor;
	[self refresh];
}

- (UIColor *)offColor
{
	return _offColor;
}

- (void)setOffColor:(UIColor *)offColor
{
	if ([offColor isEqual:self.offColor]) return;
	_offColor = offColor;
	[self refresh];
}

- (NSIndexSet *)onIndexes
{
	return _onIndexes;
}

- (void)setOnIndexes:(NSIndexSet *)onIndexes
{
	if ([onIndexes isEqualToIndexSet:self.onIndexes]) return;
	_onIndexes = onIndexes;
	[self refresh];
}

@end
