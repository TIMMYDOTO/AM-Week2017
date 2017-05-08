//
//  SpeakerDeatails.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakerDeatails : UITableViewController{
@public NSString *speakerImageURL;
}

@property (strong, nonatomic) IBOutlet UIImageView *speakerImage;
@property (strong, nonatomic) NSURL *speakerURL;
@end
