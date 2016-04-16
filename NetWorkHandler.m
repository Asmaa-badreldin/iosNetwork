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
#import "JETSSession.h"
#import "JETSAgenda.h"
#import "JETSProfile.h"

@implementation NetWorkHandler{
    NSDictionary *mydic;
}

-(NSDictionary*) getProfile
{
//geting url of webservice
NSString *mystring = @"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=eng.medhat.cs.h@gmail.com";
mydic = [NSDictionary new];
NSURL *url = [NSURL URLWithString:mystring];
NSURLRequest *request = [NSURLRequest requestWithURL:url];

AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
operation.responseSerializer =[AFJSONResponseSerializer serializer];
[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    mydic = (NSDictionary *)responseObject;
    //        NSLog([mydic objectForKey: @"status"]);
    
    NSMutableArray *arrayProfile = [mydic objectForKey:@"result"];
    
    
    
    for (int i=1; i<[arrayProfile count]; i++)
    {
        
        
        NSMutableDictionary *profileDic = [arrayProfile objectAtIndex:i];
        
        JETSProfile *profile = [JETSProfile new];
        
        [profile setFirstName:[profileDic objectForKey:@"firstName"]];
        NSLog([profile firstName]);
        NSLog(@"success");
        [_profiles addObject:profile];
    }
    
    
    [_netDelegate handle: mydic];
    
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //another delegate forhandling failerwith network
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}];

[operation start];
return mydic;
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
//        NSLog([mydic objectForKey: @"status"]);
        
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
      //another delegate forhandling failerwith network
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}*/

/*
-(NSDictionary *) getProfile{
    //geting url of webservice
    NSString *mystring = @"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=eng.medhat.cs.h@gmail.com";
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        mydic = (NSDictionary *)responseObject;
        
        NSMutableArray *arrayProfile = [mydic objectForKey:@"result"];
        
        
        
        for (int i=1; i<[arrayProfile count]; i++)
        {
            
            
            NSMutableDictionary *profileDict = [arrayProfile objectAtIndex:i];
            
            JETSProfile *profile = [JETSProfile new];
            
            profile setFirstName:[profileDict objectForKey:@"firstName"]];
            NSLog([profile firstName]);
            [profile setMiddleName:[profileDict objectForKey:@"middleName"]];
            NSLog([profile middleName]);
            [profile setLastName:[profileDict objectForKey:@"lastName"]];
            NSLog([profile lastName]);
            [profile setEmail:[profileDict objectForKey:@"email"]];
            NSLog([profile email]);
            [profile setCountryName:[profileDict objectForKey:@"country"]];
            NSLog([profile countryName]);
            [profile setCityName:[profileDict objectForKey:@"cityName"]];
            NSLog([profile cityName]);
            [profile setTitle:[profileDict objectForKey:@"title"]];
            NSLog([profile title]);
            [profile setImageURL:[profileDict objectForKey:@"imageURL"]];
            NSLog([profile imageURL]);
            
            NSMutableArray *ArrayOPhones = [profileDict objectForKey:@"phones"];
            for (int i2=1; i2<[ArrayOPhones count]; i2++) {
                NSMutableDictionary *phonesDict =[ArrayOPhones objectAtIndex:i2];
                [profile setPhones:[phonesDict objectForKey:@"phones"]];
                NSLog(@"phones are:");
                NSLog([profile phones]);
            }
            NSMutableArray *ArrayOfMobiles = [profileDict objectForKey:@"mobiles"];
            for (int i3=1; i3<[ArrayOfMobiles count]; i3++) {
                NSMutableDictionary *mobilesDict =[ArrayOfMobiles objectAtIndex:i3];
                [profile setMobiles:[mobilesDict objectForKey:@"mobiles"]];
                NSLog(@"mobiles are:");
                NSLog([profile mobiles]);
            }

            
            [_profiles addObject:profile];
        }
        
        
        [_netDelegate handle: mydic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //another delegate forhandling failerwith network
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}*/





/*-(NSDictionary *) getSessions{
    NSString *string = @"http://www.mobiledeveloperweekend.net/service/getSessions?userName=eng.medhat.cs.h@gmail.com";
    
    mydic=[NSDictionary new];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        
        mydic= (NSDictionary *)responseObject;
        NSDictionary *dicOfResult = [mydic objectForKey:@"result"];
        NSMutableArray *agendas=[dicOfResult objectForKey:@"agendas"];
        NSMutableArray *arrayOfAgendas=[NSMutableArray new];
        
        for (int i=0; i<[agendas count]; i++) {
            
            NSMutableDictionary *agendaDict = [agendas objectAtIndex:i];
            JETSAgenda *agenda=[JETSAgenda new];
            NSString *dateString=[agendaDict objectForKey:@"date"];
            double getDate=[dateString doubleValue];
            NSTimeInterval seconds = getDate / 1000;
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
            [agenda setDate:date];
            NSMutableArray *unParsedSessions=[NSMutableArray new];
            unParsedSessions=[agendaDict objectForKey:@"sessions"];
            NSMutableArray *arrayOfSessions=[NSMutableArray new];
            for (int i=0; i<[unParsedSessions count]; i++) {
                NSMutableDictionary *sessionDict = [unParsedSessions objectAtIndex:i];
                JETSSession *session=[JETSSession new];
                [session setName:[sessionDict objectForKey:@"name"]];
                [session setId:[[sessionDict objectForKey:@"id"] integerValue]];
                [session setDescription:[sessionDict objectForKey:@"description"]];
                [session setStatus:[[sessionDict objectForKey:@"status"] integerValue]];
                [session setSessionType:[sessionDict objectForKey:@"sessionType"]];
                [session setLiked:[[sessionDict objectForKey:@"like"] isEqualToString:@"true"]];
                [session setSessionTags:[sessionDict objectForKey:@"sessionTags"]];
                [session setSpeakers:[sessionDict objectForKey:@"speakers"]];
                dateString=[sessionDict objectForKey:@"startDate"];
                getDate=[dateString doubleValue];
                seconds = getDate / 1000;
                date = [NSDate dateWithTimeIntervalSince1970:seconds];
                [session setStartDate:date];
                dateString=[sessionDict objectForKey:@"endDate"];
                getDate=[dateString doubleValue];
                seconds = getDate / 1000;
                date = [NSDate dateWithTimeIntervalSince1970:seconds];
                [session setEndDate:date];
                [arrayOfSessions addObject:session];
            }
            
            [agenda setSessions:arrayOfSessions];
            [arrayOfAgendas addObject:agenda];
        }
        
          [_netDelegate handle: mydic];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
    return mydic;
    
}*/

@end
