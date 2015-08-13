//
//  MainView.h
//  IndorLocation
//
//  Created by Taras Sheremet on 20/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageViewController;

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

- (void)navigateTo:(PageViewController*)controller;
- (void)navigateBack;
@end
