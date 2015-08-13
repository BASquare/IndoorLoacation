//
//  Constants.h
//  IndorLocation
//
//  Created by Taras Sheremet on 18/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* stringTable;

#ifdef DEBUG
#define DBUG(...) NSLog(__VA_ARGS__)
#else
#define DBUG(...)
#endif

#define __PATH(__path) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:__path]

#define LOCAL(string) NSLocalizedStringFromTable(string, stringTable, nil)
#define makeColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0]

#define mapName	@"office"
//#define mapName	@"MC_Gallary"

#define UIViewAutoresizingResizeAll UIViewAutoresizingFlexibleLeftMargin | \
	UIViewAutoresizingFlexibleWidth | \
	UIViewAutoresizingFlexibleRightMargin | \
	UIViewAutoresizingFlexibleTopMargin | \
	UIViewAutoresizingFlexibleHeight | \
	UIViewAutoresizingFlexibleBottomMargin

#define titleInfo	LOCAL(@"Room Info")

#define headerHeight 36.0

#define colorSelectLayer	makeColor(0, 128, 128, 200)
#define colorHeader			makeColor(0x10, 0x84, 0xB2, 0xff)

#define fieldObject	@"Object"

#define fieldName	@"Name"
#define fieldRooms	@"Rooms"

#define fieldRoomLayer	@"Layer"
#define fieldRoomName	@"Name"
#define fieldRoomImage	@"Image"
#define fieldRoomDescription	@"Description"
#define fieldRoomPeople	@"People"

#define fieldPersonName		@"Name"
#define fieldPersonTitle	@"Title"

#define imageMarkPoint @"position_pointer.png"


@interface Constants : NSObject

@end
