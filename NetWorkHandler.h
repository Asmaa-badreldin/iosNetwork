//
//  NetWorkHandler.h
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkDelegate.h"

@interface NetWorkHandler : NSObject

@property id<NetWorkDelegate> netDelegate;

-(NSDictionary *) getSpeakers;
@property NSMutableArray *speakers;

@end
