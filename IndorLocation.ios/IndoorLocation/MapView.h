//
//  MapView.h
//  IndorLocation
//
//  Created by Taras Sheremet on 19/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVGKit.h>
#import "PageView.h"

@protocol MapViewDelegate;

@interface MapViewController : UIViewController <UIScrollViewDelegate>
@property id<MapViewDelegate> delegate;

@property (strong, nonatomic) SVGKImageView *svgView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) CAShapeLayer *selectedLayer;

- (id)init;
- (void)setContent:(SVGKImage*)document;

@end

@protocol MapViewDelegate <NSObject>
- (void)mapViewController:(MapViewController*)controller layerSelected:(CAShapeLayer*)layer;
- (BOOL)mapViewController:(MapViewController*)controller layerCanBeSelected:(CAShapeLayer*)layer;
- (BOOL)mapViewController:(MapViewController*)controller selectedLayerPressed:(CAShapeLayer*)layer;
@end

