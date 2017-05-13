//
//  TrainingTableViewController.m
//  AM Week
//
//  Created by Ion Verdes on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingTableViewController.h"

@interface TrainingTableViewController ()
@end

@implementation TrainingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[FirebaseService sharedManager] getFirebase:(AMWSpeaker) day: [NSString stringWithFormat:@"%lu",self.tabBarController.selectedIndex+1] speakerID: _training.speakerId andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _speaker = result;
        [_speakerTableViewCell setupContentWithSpeaker:_speaker[0]];
    }];
    
    [_trainingTableViewCell setupContentWithTraining:_training];
    [_aboutTrainingTableViewCell setupContentWithAboutTraining:_training];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueFromTrainingToSpeaker"]) {
        SpeakerDeatails *sd = [segue destinationViewController];
        sd.details = _speaker[0];
    }
}

@end
