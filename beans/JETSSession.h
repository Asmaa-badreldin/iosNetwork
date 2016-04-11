//
//  JETSSession.h
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSSession : NSObject

@property NSString *name;
@property NSString *size;
@property NSString *color;
@property NSString *location;
@property long id;
@property NSString *description;
@property int status;
@property NSString *sessionType;
@property Boolean *liked;
@property NSMutableArray *sessionTags;
@property NSMutableArray *speakers;
@property long date;
@property long startDate;
@property long endDate;

@end
