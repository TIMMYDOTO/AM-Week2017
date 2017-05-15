//
//  SpeakerCell.h
//  AM Week
//
//  Created by Ion Verdes on 5/12/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Speaker.h"
#import "Training.h"

@class Speaker;
@class Training;

@interface SpeakerCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *details;

@property (strong, nonatomic) IBOutlet UILabel *about;

@property (strong, nonatomic) IBOutlet UILabel *trainingTitle;
@property (strong, nonatomic) IBOutlet UILabel *trainingStream;
@property (strong, nonatomic) IBOutlet UILabel *trainingTime;
@property (strong, nonatomic) IBOutlet UILabel *trainingDate;

@property (retain, nonatomic) Speaker* speaker;
@property (retain, nonatomic) Training* training;
@property (strong, nonatomic) NSURL *imageURL;

- (void) setupContentWithSpeaker:(Speaker *)speaker;
- (void) setupContentWithAboutSpeaker:(Speaker *)speaker;
- (void) setupContentWithSpeakerTrainings:(Training *)training;

@end
