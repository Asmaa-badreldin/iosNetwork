//
//  NetWorkHandler.m
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "NetWorkHandler.h"
#import "AFNetworking.h"
#import "JETSSpeaker.h"

@implementation NetWorkHandler{
    NSDictionary *mydic;
}

/*
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
}*/

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
        
        NSMutableArray *arrayOfSpeakers = [mydic objectForKey:@"result"];
        
        
        
        for (int i=1; i<[arrayOfSpeakers count]; i++)
        {
            
            
            NSMutableDictionary *speakerDict = [arrayOfSpeakers objectAtIndex:i];
            
            JETSSpeaker *speaker = [JETSSpeaker new];
            
            [speaker setFirstName:[speakerDict objectForKey:@"firstName"]];
             NSLog([speaker firstName]);
            [speaker setMiddleName:[speakerDict objectForKey:@"middleName"]];
            NSLog([speaker middleName]);
            [speaker setLastName:[speakerDict objectForKey:@"lastName"]];
            NSLog([speaker lastName]);
            //[speaker setGender:[speakerDict objectForKey:@"gender"]];
           // NSLog([speaker gender]);
            [speaker setCompanyName:[speakerDict objectForKey:@"companyName"]];
            NSLog([speaker companyName]);
            [speaker setBiography:[speakerDict objectForKey:@"biography"]];
            NSLog([speaker biography]);
            [speaker setImageURL:[speakerDict objectForKey:@"imageURL"]];
            NSLog([speaker imageURL]);
            [speaker setTitle:[speakerDict objectForKey:@"title"]];
            NSLog([speaker title]);
            
            NSMutableArray *ArrayOPhones = [speakerDict objectForKey:@"phones"];
            for (int i2=1; i2<[ArrayOPhones count]; i2++) {
                NSMutableDictionary *phonesDict =[ArrayOPhones objectAtIndex:i2];
                [speaker setPhones:[phonesDict objectForKey:@"phones"]];
                NSLog(@"phones are:");
                NSLog([speaker phones]);
            }
            NSMutableArray *ArrayOfMobiles = [speakerDict objectForKey:@"mobiles"];
            for (int i3=1; i3<[ArrayOfMobiles count]; i3++) {
                NSMutableDictionary *mobilesDict =[ArrayOfMobiles objectAtIndex:i3];
                [speaker setMobiles:[mobilesDict objectForKey:@"mobiles"]];
                NSLog(@"mobiles are:");
                NSLog([speaker mobiles]);
            }

            [_speakers addObject:speaker];
        }
        
        
        [_netDelegate handle: mydic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}



@end
