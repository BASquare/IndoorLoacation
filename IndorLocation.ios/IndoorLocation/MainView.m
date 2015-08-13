//
//  MainView.m
//  IndorLocation
//
//  Created by Taras Sheremet on 20/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "Constants.h"

#import "MainView.h"
#import "PageView.h"

#import "MapView.h"

@interface MainViewController ()
- (void)activateView:(PageViewController*)controller;
@end

@implementation MainViewController {
	UIViewController* _currentView;
	NSArray* _viewStack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
	return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigateTo:(PageViewController*)controller {
	if (_viewStack == nil) _viewStack = [NSArray array];
	
	_viewStack = [_viewStack arrayByAddingObject:controller];
	[self activateView:controller];
}

- (void)navigateBack {
	if (_viewStack.count > 1) {
		NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, _viewStack.count - 1)];
		_viewStack = [_viewStack objectsAtIndexes:set];
		
		id controller = [_viewStack lastObject];
		[self activateView:controller];
	}
}

- (void)activateView:(PageViewController*)controller {
	if(controller.view.superview != _contentView) {
		UIView *view = [controller view];
		view.frame = _contentView.bounds;
		view.autoresizingMask = UIViewAutoresizingResizeAll;
		
		[_contentView addSubview:view];
	}
	
	[_currentView.view removeFromSuperview];
	//[_currentView.view setHidden:YES];
	_currentView = controller;
	[self updateTitle];
	[_currentView.view setHidden:NO];
}

-(void)updateTitle {
	_labelTitle.text = _currentView.title;
}

@end
