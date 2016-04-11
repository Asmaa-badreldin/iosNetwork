//
//  JETSProfile.h
//  ProjectBeans
//
//  Created by JETS on 4/3/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSProfile : NSObject

@property long id;
@property NSString *birthDate;
@property NSString *code;
@property NSString *imageURL;
@property NSString *middleName;
@property NSString *gender;
@property NSString *firstName;
@property NSString *email;
@property NSString *lastName;
@property NSString *countryName;
@property NSString *cityName;
@property NSString *title;
@property NSMutableArray *phones;
@property NSMutableArray *mobiles;

@end
