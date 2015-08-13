//
//  OfficeMapView.m
//  IndorLocation
//
//  Created by Taras Sheremet on 22/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "OfficeMapView.h"
#import "BuildingInfo.h"

@interface OfficeMapViewController ()

@end

@implementation OfficeMapViewController {
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (nibNameOrNil == nil) {
		nibNameOrNil = @"OfficeMapView";
	}
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

	CGRect mapRect = _mapContaner.bounds;
	
	_mapView = [[MapViewController alloc] initWithNibName:nil bundle:nil];
	UIView *view = _mapView.view;
	view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	view.frame = mapRect;
	[_mapContaner addSubview:view];
	
	SVGKImage* document = [SVGKImage imageNamed:[mapName stringByAppendingPathExtension:@"svg"]];
	[_mapView setContent:document];
	_mapView.delegate = self;
	[_infoButton setHidden:YES];
	
	self.title = [BuildingInfo sharedObject].name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapViewController:(MapViewController *)controller layerSelected:(CAShapeLayer *)layer {
	NSString *info = @"";
	if (nil != layer) {
		id roomInfo = [[BuildingInfo sharedObject] roomInfo:layer.name];
		info = roomInfo[fieldRoomName];
	}
	_infoLabel.text = info;
	[_infoButton setHidden:(nil == layer)];
}

- (BOOL)mapViewController:(MapViewController *)controller layerCanBeSelected:(CAShapeLayer *)layer {
	DBUG(@"Want to select:%@", layer.name);
	id roomInfo = [[BuildingInfo sharedObject] roomInfo:layer.name];
	return roomInfo != nil;
}

- (BOOL)mapViewController:(MapViewController*)controller selectedLayerPressed:(CAShapeLayer*)layer {
	[self onInfo:nil];
	return NO;
}

- (IBAction)onInfo:(id)sender {
	id roomInfo = [[BuildingInfo sharedObject] roomInfo:_mapView.selectedLayer.name];
	[appDelegate() showObjectInfo:roomInfo];
}
@end
