//
//  NetWorkHandler.h
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkDelegate.h"
#import "JETSProfile.h"

@interface NetWorkHandler : NSObject

@property id<NetWorkDelegate> netDelegate;

//-(NSDictionary *) getSpeakers;
-(NSDictionary *) getProfile;
//-(NSDictionary *) getSpeakers:(JETSProfile*)profile;
//-(NSDictionary *) getSessions;
@property NSMutableArray *profiles;
@property NSMutableArray *speakers;
@property NSMutableArray *sessions;

@property NSString *test;

@end
