//
//  SpeakerDeatails.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "SpeakerDeatails.h"

@interface SpeakerDeatails ()
@end

@implementation SpeakerDeatails

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_speakerTableViewCell setupContentWithSpeaker: _details];
    [_aboutSpeakerTableViewCell setupContentWithAboutSpeaker: _details];
    [_speakerTrainingsTableViewCell setupContentWithSpeakerTrainings: _training];
}

@end
