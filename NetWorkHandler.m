//
//  NetWorkHandler.m
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "NetWorkHandler.h"
#import "AFNetworking.h"

@implementation NetWorkHandler{
    NSDictionary *mydic;
}

-(NSDictionary *) getSpeakers{
    //geting url of webservice
    NSString *mystring = @"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=eng.medhat.cs.h@gmail.com";
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        mydic = (NSDictionary *)responseObject;
        NSLog([mydic objectForKey: @"status"]);
        [_netDelegate handle: mydic];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}



@end
