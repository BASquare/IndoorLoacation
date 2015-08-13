//
//  OfficeMapView.h
//  IndorLocation
//
//  Created by Taras Sheremet on 22/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapView.h"

@interface OfficeMapViewController : PageViewController<MapViewDelegate, CLLocationManagerDelegate>
@property MapViewController* mapView;
@property (weak, nonatomic) IBOutlet UIView *mapContaner;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (IBAction)onInfo:(id)sender;
@end
