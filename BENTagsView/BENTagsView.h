//
//  BENTagsView.h
//
//
//  Created by Ben Packard on 3/12/14.
//
//

#import <UIKit/UIKit.h>

@interface BENTagsView : UIView

@property NSArray *tagStrings;
@property UIFont *font;
@property UIColor *textColor, *onColor, *offColor;
@property NSIndexSet *onIndexes;
@property NSInteger tagCornerRadius;

@end
