//
//  TrainingDetailsCell.h
//  AM Week
//
//  Created by Ion Verdes on 5/12/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Training.h"
#import "Speaker.h"

@class Training;
@class Speaker;

@interface TrainingDetailsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *language;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *stream;
@property (strong, nonatomic) IBOutlet UILabel *about;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *picture;

@property (retain, nonatomic) Training* training;
@property (retain, nonatomic) Speaker* speaker;
@property (strong, nonatomic) NSURL *imageURL;

- (void) setupContentWithTraining:(Training *)training;
- (void) setupContentWithSpeaker:(Speaker *)speaker;
- (void) setupContentWithAboutTraining:(Training *)training;

@end
