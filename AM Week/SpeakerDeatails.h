//
//  SpeakerDeatails.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Training.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface SpeakerDeatails : UITableViewController{
@public NSString *speakerImageURL;
}

@property (strong, nonatomic) IBOutlet UILabel *speakerName;
@property (strong, nonatomic) IBOutlet UILabel *speakerDetails;
@property (strong, nonatomic) IBOutlet UIImageView *speakerImage;
@property (strong, nonatomic) IBOutlet UILabel *about;

@property (strong, nonatomic) IBOutlet UILabel *trainingTitle;
@property (strong, nonatomic) IBOutlet UILabel *trainingStream;
@property (strong, nonatomic) IBOutlet UILabel *trainingTime;

@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) Training *details;
@property (strong, nonatomic) NSURL *speakerURL;
@end
