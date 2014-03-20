# BENTagsView

**A simple UIView sublass for displaying a series of tags.**

`BENTagsView` allows you to quickly add a series of tags to any `UIView`.

<img src="https://raw.githubusercontent.com/benpackard/BENTagsView/master/BENTagsViewDemo/Screenshot1.png" width="640px"></img>

## Installation

[CocoaPods](http://cocoapods.org) is the recommended method of installing BENTagsView. Simply add the following line to your `Podfile`:

#### Podfile

``` ruby
pod 'BENTagsView'
```

##Usage

``` objective-c
	//create the tags view
	BENTagsView *tagsView = [[BENTagsView alloc] init];
	
	//set the tag strings
	tagsView4.tagStrings = @[@"tag one", @"tag two", @"tag three""];		
	
	//switch some tags on - all others will be off
	NSMutableIndexSet *onIndexes = [NSMutableIndexSet indexSetWithIndex:0];
	[onIndexes addIndex:2];
	[tagsView setOnIndexes:onIndexes];

	//customize on/off colors
	[tagsView setOnColor:[UIColor greenColor]];
	[tagsView setOffColor:[UIColor redColor]];
	
	//customize font, corner radii
	[tagsView setFont:[UIFont fontWithName:@"Baskerville-BoldItalic" size:16]];
	[tagsView setTagCornerRadius:3];
	
	//add the view
	[someView addSubview:tagsView];
```

## Demo

Build and run the `BENTagsViewDemo` project in Xcode to see `BENTagsView` in action.

## Contact

Ben Packard

- http://twitter.com/benpackard
- ben@benpackard.org

## License

TTTAttributedLabel is available under the MIT license. See the LICENSE file for more info.
