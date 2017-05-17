//
//  SpeakerDeatails.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speaker.h"
#import "SpeakerCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FirebaseService.h"
#import "Training.h"
#import <FirebaseDatabase/FirebaseDatabase.h>

@interface SpeakerDeatails : UITableViewController{
    @public NSString *speakerImageURL;
}

@property (strong, nonatomic) IBOutlet SpeakerCell *speakerTableViewCell;
@property (strong, nonatomic) IBOutlet SpeakerCell *aboutSpeakerTableViewCell;
@property (strong, nonatomic) IBOutlet SpeakerCell *speakerTrainingsTableViewCell;

@property (strong, nonatomic) Speaker *details;
@property (strong, nonatomic) Training *training;
@property (strong, nonatomic) NSURL *speakerURL;
@end
