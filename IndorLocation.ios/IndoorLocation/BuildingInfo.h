//
//  BuildingInfo.h
//  IndorLocation
//
//  Created by Taras Sheremet on 25/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Serializable.h"

@class SVGKImage;

@interface BuildingInfo : NSObject <SharedObject> {
	NSMutableArray *_roomsData;
}
@property (strong, nonatomic, readonly) NSArray *roomsData;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *info;
@property (strong, nonatomic) SVGKImage *map;

- (id)roomInfo:(NSString*)layerName;
@end
