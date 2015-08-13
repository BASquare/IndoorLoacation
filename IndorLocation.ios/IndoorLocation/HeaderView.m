//
//  HeaderView.m
//  IndoorLocation
//
//  Created by Taras Sheremet on 21/2/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "HeaderView.h"
#import "Constants.h"

@implementation UIView (Autolayout)
+(id)autolayoutView
{
	UIView *view = [[self alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	view.translatesAutoresizingMaskIntoConstraints = NO;
	return view;
}
@end

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self != nil) {
		[self viewDidLoaded];
	}
	
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self viewDidLoaded];
}

#define constraint(format, views) [NSLayoutConstraint constraintsWithVisualFormat:format \
options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]

- (void)viewDidLoaded {
	[self createTitle];
	
	self.backgroundColor = colorHeader;
}

- (void)createTitle {
	_titleLable = [UILabel autolayoutView];
	[self addSubview:_titleLable];
	NSMutableArray *constraints = [NSMutableArray array];
	NSDictionary *views = @{@"title":_titleLable};
	
	[constraints addObjectsFromArray:constraint(@"|-0.0-[title]-0.0-|", views)];
	[constraints addObjectsFromArray:constraint(@"V:|-[title]-|", views)];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	if (nil != self.superview) {
		NSMutableArray *constraintsToRemove = [NSMutableArray array];
		for (NSLayoutConstraint * constraint in self.superview.constraints) {
			if (constraint.firstItem == self || constraint.secondItem == self) {
				[constraintsToRemove addObject:constraint];
			}
		}
		[self.superview removeConstraints:constraintsToRemove];
	}
}

- (void)didMoveToSuperview {
	if (nil != self.superview) {
		NSMutableArray *constraints = [NSMutableArray array];
		NSDictionary *views = @{@"header":self};
		
		[constraints addObjectsFromArray:constraint(@"|-0.0-[header]-0.0-|", views)];
		[constraints addObjectsFromArray:constraint(@"V:|-2.0-[header(36.0)]", views)];
		
		[self.superview addConstraints:constraints];

	}
}

- (void)setTitle:(NSString*)title {
	_titleLable.text = title;
}

@end
