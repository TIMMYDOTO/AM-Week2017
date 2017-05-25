//
//  TrainingDetailsCell.m
//  AM Week
//
//  Created by Ion Verdes on 5/12/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingDetailsCell.h"

@interface TrainingDetailsCell()
@end

@implementation TrainingDetailsCell

- (void) setupContentWithTraining:(Training *)training{
    _training = training;
    
    _title.text = _training.title;
    _date.text = _training.date;
    _location.text = _training.location;
    _language.text = _training.language;
    _time.text = _training.fullTime;
    _type.text = _training.type;
    _stream.text = _training.stream;
}

- (void) setupContentWithAboutTraining:(Training *)training{
    _training = training;
    _about.text = _training.about;
}

- (void) setupContentWithSpeaker:(Speaker *)speaker{
    _speaker = speaker;
    
    _name.text = _speaker.name;
    _imageURL = [NSURL URLWithString:_speaker.imageURL];
    
    UIImage *image = [UIImage imageNamed:@"Image Placeholder"];
    [_picture sd_setImageWithURL:_imageURL placeholderImage:image];
    self.picture.layer.cornerRadius = self.picture.frame.size.height/2;
    self.picture.layer.masksToBounds = YES;
}

@end
