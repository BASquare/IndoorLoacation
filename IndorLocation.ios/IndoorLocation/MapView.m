//
//  MapView.m
//  IndorLocation
//
//  Created by Taras Sheremet on 19/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "MapView.h"
#import "Constants.h"
#include <CAShapeLayerWithHitTest.h>

@interface MapViewController ()

@end

@implementation MapViewController {
	CAShapeLayer *_selection;
}

- (id)init {
	return [super initWithNibName:@"MapView" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//[self.view addSubview:_buttonInfo];
	
	self.scrollView.minimumZoomScale=0.5;
	self.scrollView.maximumZoomScale=2.0;

}

- (void)setContent:(SVGKImage*)document {
	if (_svgView) {
		[_svgView removeFromSuperview];
		_svgView = nil;
	}
	_svgView = [[SVGKLayeredImageView alloc] initWithSVGKImage:document];
	
	[self.scrollView insertSubview:_svgView atIndex:0];
	
	CGRect rc = _svgView.bounds;
	CGPoint pt = CGPointMake(0, 0);
	
	if (rc.size.height > _svgView.frame.size.height) {
		pt.y = (rc.size.height - _svgView.frame.size.height) / 2;
	}
	if (rc.size.width > _svgView.frame.size.width) {
		pt.x = (rc.size.width - _svgView.frame.size.width) / 2;
	}
	
	rc.origin = pt;
	_svgView.frame = rc;
	
	self.scrollView.contentSize = rc.size;
	
	[_svgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)]];
}

//- (void)viewDidLayoutSubviews {
//	[super viewDidLayoutSubviews];
//	
//	CGRect viewContent = _svgView.bounds;
//	CGRect viewScroll = self.view.bounds;
//	
//	if (viewScroll.size.width > viewContent.size.width) {
//		viewScroll.origin.x = (viewScroll.size.width - viewContent.size.width) / 2;
//	}
//	if (viewScroll.size.height > viewContent.size.height) {
//		viewScroll.origin.y = (viewScroll.size.height - viewContent.size.height) / 2;
//	}
//	
//	_scrollView.frame = viewScroll;
//}

- (void)selectLayer:(CALayer*)layer {
	if (nil != _selection && _selection != layer) {
		[_selection removeFromSuperlayer];
		_selection = nil;
		_selectedLayer = nil;
	}
	
	if (![layer isKindOfClass:[CAShapeLayerWithHitTest class]]) {
		return; // Exit here !!!!
	}

	
	if (layer && [layer isKindOfClass:[CAShapeLayer class]]&& _selection == nil) {
		if([self.delegate mapViewController:self layerCanBeSelected:(CAShapeLayer*)layer]) {
			_selectedLayer = (CAShapeLayer*)layer;
			_selection = [[CAShapeLayerWithHitTest alloc] init];
			[_selection setFillColor:[colorSelectLayer CGColor]];
			[_selection setPath:[(id)layer path]];
			[_selection setOpacity:1.0];
			_selection.frame = layer.frame;
			
			CGRect rc = _selection.frame;
			rc.origin = CGPointMake(0, 0);
			_selection.frame = rc;
			
			[layer addSublayer:_selection];
			
			DBUG(@"Layer selected: %@", layer);
		}
		
		[self.delegate mapViewController:self layerSelected:(CAShapeLayer*)_selectedLayer];
	} else {
		BOOL deselect = YES;
		if(_delegate && [_delegate respondsToSelector:@selector(mapViewController:selectedLayerPressed:)]) {
			deselect = [_delegate mapViewController:self selectedLayerPressed:_selectedLayer];
		}
		if (deselect) {
			[_selection removeFromSuperlayer];
			_selection = nil;
			_selectedLayer = nil;
			[self.delegate mapViewController:self layerSelected:nil];
		}
	}
}

- (void)handleTapGesture:(UITapGestureRecognizer*) recognizer {
	CGPoint pt = [recognizer locationInView:self.scrollView];
	
	CALayer* hitLayer = [_svgView.layer hitTest:pt];
	[self selectLayer:hitLayer];
	if (nil != _selection) {
		UIImage*    backgroundImage = [UIImage imageNamed:imageMarkPoint];
		CALayer*    aLayer = [CALayer layer];
		
		CGRect      startFrame = CGPathGetPathBoundingBox(_selection.path);
		startFrame.origin.x = startFrame.origin.x + startFrame.size.width / 2.0;
		startFrame.origin.y = startFrame.origin.y + startFrame.size.height / 2.0;
		startFrame.size.width = CGImageGetWidth(backgroundImage.CGImage);
		startFrame.size.height = CGImageGetHeight(backgroundImage.CGImage);
		
		startFrame.origin.x -= startFrame.size.width / 2;
		startFrame.origin.y -= startFrame.size.height;
		
		aLayer.contents = (__bridge id)backgroundImage.CGImage;
		aLayer.frame = startFrame;
		[_selection addSublayer:aLayer];
		
		
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return _svgView;
}


@end
