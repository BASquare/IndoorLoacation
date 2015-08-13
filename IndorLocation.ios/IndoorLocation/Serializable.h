//
//  Serializable.h
//  ReachMe
//
//  Created by Taras Sheremet on 30/9/14.
//  Copyright (c) 2014 BASquare. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Serializable <NSObject>
@optional
- (void)load;
- (void)store;

- (id)fillFromDictionary:(NSDictionary*)data;
- (NSDictionary*)toDictionary;

- (id)fillFromData:(id)data;
@end

@protocol SharedObject <NSObject>
+ (instancetype)sharedObject;
@optional
+ (instancetype)sharedObject:(BOOL)cleare;
- (NSString*)fileName;
@end

#define ImplementShared() \
+(instancetype)sharedObject { return [self sharedObject:NO]; } \
+(instancetype)sharedObject:(BOOL)cleare { \
	static id shared = nil; \
	if(cleare) shared = nil; \
	if(nil == shared) { shared = [[self alloc] init]; \
		if([shared respondsToSelector:@selector(fileName)]) { \
		[shared fillFromData:[NSData dataWithContentsOfFile:[(id<SharedObject>)shared fileName]]]; } \
	} \
	return shared; \
}