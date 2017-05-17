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
#import "TrainingDetailsCell.h"
#import "FirebaseService.h"
#import <FirebaseDatabase/FirebaseDatabase.h>

@interface TrainingTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *trainingTableView;
@property (strong, nonatomic) IBOutlet TrainingDetailsCell *trainingTableViewCell;
@property (strong, nonatomic) IBOutlet TrainingDetailsCell *aboutTrainingTableViewCell;
@property (strong, nonatomic) IBOutlet TrainingDetailsCell *speakerTableViewCell;
@property (strong, nonatomic) Training *training;

@end
