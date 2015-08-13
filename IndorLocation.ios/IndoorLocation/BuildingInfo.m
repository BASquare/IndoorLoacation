//
//  BuildingInfo.m
//  IndorLocation
//
//  Created by Taras Sheremet on 25/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "BuildingInfo.h"
#import "SVGKit.h"
#import "Constants.h"

@implementation BuildingInfo
@synthesize roomsData = _roomsData;

ImplementShared()

- (NSString*)fileName {
	return [[NSBundle mainBundle] pathForResource:mapName ofType:@"json"]; // __PATH(@"office.json");
}

- (id)fillFromData:(id)data {
	id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
	if (jsonObject) {
		@try {
			id buildingInfo = jsonObject[fieldObject];
			_name = buildingInfo[fieldName];
			_roomsData = buildingInfo[fieldRooms];
		}
		@catch (NSException *exception) {
			DBUG(@"Error Loading BuildingInfo, %@", exception);
		}
	}
	return self;
}

- (id)roomInfo:(NSString*)layerName {
	NSUInteger index = [_roomsData indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
		return ([layerName compare:obj[fieldRoomLayer]] == NSOrderedSame);
	}];
	return index == NSNotFound?nil:_roomsData[index];
}

@end
