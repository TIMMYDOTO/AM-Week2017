//
//  SpeakerCell.m
//  AM Week
//
//  Created by Ion Verdes on 5/12/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "SpeakerCell.h"

@implementation SpeakerCell

- (void) setupContentWithSpeaker:(Speaker *)speaker{
    _speaker = speaker;
    
    _name.text = _speaker.name;
    
    _imageURL = [NSURL URLWithString:_speaker.imageURL];
    UIImage *image = [UIImage imageNamed:@"Image Placeholder"];
    
    [_image sd_setImageWithURL:_imageURL placeholderImage:image];
    self.image.layer.cornerRadius = self.image.frame.size.height/2;
    self.image.layer.masksToBounds = YES;
}

- (void) setupContentWithAboutSpeaker:(Speaker *)speaker{
    _speaker = speaker;
    
    _about.text = _speaker.longInfo;
}

- (void) setupContentWithSpeakerTrainings:(Training *)training{
    _training = training;
    
    _trainingTitle.text = _training.title;
    _trainingStream.text = _training.stream;
    _trainingTime.text = _training.time;
    _trainingDate.text = _training.date;
}

@end
