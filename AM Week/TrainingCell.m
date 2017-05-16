//
//  TrainingCell.m
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingCell.h"
#import "Training.h"
#import <UserNotifications/UserNotifications.h>
#define kSelectedTrainigs @"SelectedTrainings"

@interface TrainingCell()
@end

@implementation TrainingCell


- (IBAction)showSpeakerProfile:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(showSpeakerProfileForTraining:)]) {
        [self.delegate showSpeakerProfileForTraining:self.training];
    }
}

- (IBAction)assignToTraining:(UIButton*)sender {
    NSString *identifier = _training.trainingId;
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    if([self isSelectedTraining]) {
        NSArray *array = [NSArray arrayWithObjects:identifier, nil];

        [center removePendingNotificationRequestsWithIdentifiers:array];
        
        [center getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotificationRequest *> * _Nonnull requests) {
            if (requests.count>0) {
            }
        }];
    } else {
        NSString *dateStr = _training.time;
        dateStr = [[dateStr componentsSeparatedByString:@" - "]objectAtIndex:0];
        _dateForNotification = [NSString stringWithFormat:@"%@ %@", dateStr, _dateForNotification];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"HH:mm d.MM.yyyy"];
        
        NSDate *date = [dateFormat dateFromString:_dateForNotification];
        
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        [content setBody: [NSString stringWithFormat:@"Training '%@' is about to start at %@", _training.title, dateStr]];
        [content setTitle:@"Reminder"];
        
        NSDateComponents *triggerDate = [[NSCalendar currentCalendar]
                                         components:NSCalendarUnitYear +
                                         NSCalendarUnitMonth + NSCalendarUnitDay +
                                         NSCalendarUnitHour + NSCalendarUnitMinute +
                                         NSCalendarUnitSecond fromDate:date];
        if(triggerDate.minute - 15 < 0){
            [triggerDate setHour:triggerDate.hour - 1];
            [triggerDate setMinute:triggerDate.minute + 45];
        } else {
            [triggerDate setMinute:triggerDate.minute - 15];
        }

        UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerDate repeats:NO];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (error != nil) {
                NSLog(@"Something went wrong: %@",error);
            }
        }];
    }
    _starButton.selected = !_starButton.selected;
    [self changeTrainingState];
    
}

- (void) changeTrainingState {
    NSMutableArray* arr =  [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:kSelectedTrainigs]];
    
    if (arr) {
        if ([arr containsObject:_training.trainingId]) {
            [arr removeObject:_training.trainingId];
        } else {
            [arr addObject:_training.trainingId];
        }
    } else {
        arr = [NSMutableArray arrayWithObject:_training.trainingId];
     }
    
     [[NSUserDefaults standardUserDefaults] setObject:arr forKey:kSelectedTrainigs];
}
- (BOOL) isSelectedTraining {
    NSMutableArray* arr = [[NSUserDefaults standardUserDefaults] objectForKey:kSelectedTrainigs];
    return [arr containsObject:_training.trainingId];
}

- (void) setupContentWithTraining:(Training *)training{
    _training = training;

    _stream.text = _training.stream;
    _title.text = _training.title;
    _timeDate.text = _training.time;
    _speakerName.text = _training.speaker;
    
    _starButton.selected = [self isSelectedTraining];
    
    _dateForNotification = _training.date;
    
    _imageURL = [NSURL URLWithString:_training.speakerImage];
    UIImage *image = [UIImage imageNamed:@"Image Placeholder"];
    
    [self.photo sd_setImageWithURL:_imageURL forState:UIControlStateNormal placeholderImage:image];
    self.photo.layer.cornerRadius = self.photo.frame.size.height/2;
    self.photo.layer.masksToBounds = YES;
    self.photo.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

@end
