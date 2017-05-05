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

@property (weak, nonatomic) IBOutlet UILabel *stream;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timeDate;
@property (weak, nonatomic) IBOutlet UILabel *speaker;
@property (strong, nonatomic) IBOutlet UIButton *photo;
@end

@implementation TrainingCell

- (void) setupContentWithTraining:(Training *)training{
    _training = training;

   
    _stream.text = _training.stream;
    _title.text = _training.title;
    _timeDate.text = _training.time;
    _speaker.text = _training.speaker;
    
    NSURL *imageURL = [NSURL URLWithString:_training.speakerImage];
    UIImage *image = [UIImage imageNamed:@"person"];
    [self.photo sd_setImageWithURL:imageURL forState:UIControlStateNormal placeholderImage:image];
    self.photo.layer.cornerRadius = self.photo.frame.size.height/2;
    self.photo.layer.masksToBounds = YES;
    self.photo.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

@end
