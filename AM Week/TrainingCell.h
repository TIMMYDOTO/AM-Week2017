//
//  TrainingCell.h
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIButton+WebCache.h>
@class Training;


@protocol TrainingCellDelegate <NSObject>

- (void) showSpeakerProfileForTraining: (Training*) training;

@end

@interface TrainingCell : UITableViewCell

@property (retain, nonatomic) id <TrainingCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *stream;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timeDate;
@property (weak, nonatomic) IBOutlet UILabel *speakerName;
@property (strong, nonatomic) IBOutlet UIButton *photo;
@property (retain, nonatomic) Training* training;
@property (strong, nonatomic) NSURL *imageURL;
- (void) setupContentWithTraining:(Training *)training;

@end
