//
//  JETSSpeaker.h
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSSpeaker : NSObject

@property long id;
@property NSString *gender;
@property NSString *imageURL;
@property NSString *middleName;
@property NSString *biography;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *companyName;
@property NSString *title;
@property NSMutableArray *phones;
@property NSMutableArray *mobiles;

@end
