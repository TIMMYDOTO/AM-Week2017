//
//  TrainingTableViewController.h
//  AM Week
//
//  Created by Ion Verdes on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Training.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "SpeakerDeatails.h"
//#import "TrainingViewController.m"
@interface TrainingTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *language;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *stream;
@property (strong, nonatomic) IBOutlet UIButton *speakerImage;
@property (strong, nonatomic) IBOutlet UILabel *speakerName;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSString *str1;
@property (strong, nonatomic) Training *training;

@end
