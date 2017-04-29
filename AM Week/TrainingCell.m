//
//  TrainingCell.m
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingCell.h"
#import "Training.h"

@interface TrainingCell()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timeDate;
@property (weak, nonatomic) IBOutlet UILabel *speaker;

@end

@implementation TrainingCell

- (void) setupContentWithQuiz:(Training *)training{
    _training = training;
    
    _title.text = _training.title;
    _timeDate.text = _training.timeDate;
//    _speaker.text = _training.speaker;
}

@end
