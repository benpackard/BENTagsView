//
//  BENTag.m
//  BENTagsView
//
//  Created by Ben Packard on 3/12/14.
//
//

#import "BENTag.h"

@implementation BENTag

@synthesize on = _on;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		//defaults
		self.on = NO;
		self.offColor = self.offColor = [UIColor colorWithRed:0.79 green:0.79 blue:0.79 alpha:1.0];
		self.onColor = [UIColor blackColor];
				
		//add the label
		self.textLabel = [[UILabel alloc] init];
		self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.textLabel.textColor = [UIColor whiteColor];
		self.textLabel.font = [UIFont systemFontOfSize:9];
		[self addSubview:self.textLabel];
		NSDictionary *views = @{@"label":self.textLabel};
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-7-[label]-7-|"
																	 options:0
																	 metrics:nil
																	   views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[label]-2-|"
																	 options:0
																	 metrics:nil
																	   views:views]];

		//refresh
		[self refresh];
    }
    return self;
}

- (void)refresh
{
	[self setPersistantBackgroundColor:self.on ? self.onColor : self.offColor];
}

- (BOOL)on
{
	return _on;
}

- (void)setOn:(BOOL)on
{
	_on = on;
	[self refresh];
}

//if embedded in a UITableViewCell, on cell selection the default behavior is for all of the cell's subviews to set their background color to transparent. See SO 7053340. To avoid this, make the default implementation of setBackground do nothing, and instead provide a different method to change the color internally.
- (void)setPersistantBackgroundColor:(UIColor *)color
{
	[super setBackgroundColor:color];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
	//do nothing
}

@end
