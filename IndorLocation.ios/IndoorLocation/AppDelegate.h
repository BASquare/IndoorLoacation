//
//  AppDelegate.h
//  IndorLocation
//
//  Created by Taras Sheremet on 18/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <UIKit/UIKit.h>

#define appDelegate() ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define rootController() appDelegate().rootViewController

@class MainViewController;
@protocol MapViewDelegate;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readonly, getter=mainController) MainViewController* mainController;

- (void)showObjectInfo:(id)object;

@end

