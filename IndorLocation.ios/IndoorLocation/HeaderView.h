//
//  HeaderView.h
//  IndoorLocation
//
//  Created by Taras Sheremet on 21/2/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Autolayout)
+(id)autolayoutView;
@end

@interface HeaderView : UIView
@property (strong, readonly) UILabel* titleLable;
- (void)viewDidLoaded;

@end
