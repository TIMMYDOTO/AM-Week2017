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
    
    [[FirebaseService sharedManager] getFirebase:(AMWSpeaker) day: [NSString stringWithFormat:@"%lu",self.tabBarController.selectedIndex+1] speakerID: _training.speakerId andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _details = result[0];
        [_speakerTableViewCell setupContentWithSpeaker: _details];
        [_aboutSpeakerTableViewCell setupContentWithAboutSpeaker: _details];
    }];
    
    [_speakerTrainingsTableViewCell setupContentWithSpeakerTrainings: _training];
}

@end
