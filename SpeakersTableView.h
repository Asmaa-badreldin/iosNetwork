//
//  SpeakersTableView.h
//  IOSProject
//
//  Created by JETS on 4/11/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakersTableView : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *speakerstable;

@property NSMutableArray *speakers;
@property (weak, nonatomic) IBOutlet UILabel *labelFN;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *labelImage;

@end
