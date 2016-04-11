//
//  SpeakersTableView.m
//  IOSProject
//
//  Created by JETS on 4/11/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "SpeakersTableView.h"
#import "NetWorkHandler.h"
#import "JETSSpeaker.h"

 NSDictionary *speakdic;
UIActivityIndicatorView *activity;
@interface SpeakersTableView ()

@end

@implementation SpeakersTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NetWorkHandler *net=[NetWorkHandler new];
    
    speakdic = [net getSpeakers];
    
    
    NSMutableArray *arrayOfSpeakers = [speakdic objectForKey:@"result"];
    
    
    
    for (int i=1; i<[arrayOfSpeakers count]; i++) {
        
        NSMutableDictionary *speakerDict = [arrayOfSpeakers objectAtIndex:i];
        
        JETSSpeaker *speaker = [JETSSpeaker new];
        
        [speaker setFirstName:[speakerDict objectForKey:@"firstName"]];
        [speaker setImageURL:[speakerDict objectForKey:@"imageURL"]];
        [speaker setTitle:[speakerDict objectForKey:@"title"]];
        
        
        [_speakers addObject:speaker];
    }
    
    [self.speakerstable reloadData];
    [activity stopAnimating];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_speakers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    UILabel *titleLabel = (UILabel*) [cell viewWithTag:1];
    UILabel *voteLabel = (UILabel*) [cell viewWithTag:2];
    UIImageView *imageView = (UIImageView*) [cell viewWithTag:3];
    
    
    //  [titleLabel setHtml:@"<Font name=\"verdana\" size=\"6\" color=\"Blue\">Opening</Font>"];
    
    titleLabel.text = [[_speakers objectAtIndex:indexPath.row] name];
    voteLabel.text = [[_speakers objectAtIndex:indexPath.row] title];
    
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Add code here to do background processing
        //
        //
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[[_speakers objectAtIndex:indexPath.row] imageURL]]];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            // Add code here to update the UI/send notifications based on the
            // results of the background processing
            UIImage *userImage =[UIImage imageWithData:imageData];
            
            if (userImage != nil) {
                
                imageView.image =userImage;
            }else{
                
                
                imageView.image = [UIImage imageNamed:@"jets.png"];
            }
            
        });
    });
    
    
    
    return cell;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    UILabel *titleLabel = (UILabel*) [cell viewWithTag:1];
    UILabel *voteLabel = (UILabel*) [cell viewWithTag:2];
    UIImageView *imageView = (UIImageView*) [cell viewWithTag:3];
    
    
    //  [titleLabel setHtml:@"<Font name=\"verdana\" size=\"6\" color=\"Blue\">Opening</Font>"];
    
    titleLabel.text = [[_speakers objectAtIndex:indexPath.row] name];
    voteLabel.text = [[_speakers objectAtIndex:indexPath.row] title];
    
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Add code here to do background processing
        //
        //
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[[_speakers objectAtIndex:indexPath.row] imageURL]]];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            // Add code here to update the UI/send notifications based on the
            // results of the background processing
            UIImage *userImage =[UIImage imageWithData:imageData];
            
            if (userImage != nil) {
                
                imageView.image =userImage;
            }else{
                
                
                imageView.image = [UIImage imageNamed:@"jets.png"];
            }
            
        });
    });
    
    
    
    return cell;
}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
