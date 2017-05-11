//
//  QuizViewController.h
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInformation.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface QuizViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, GIDSignInUIDelegate, GIDSignInDelegate>

@property (nonatomic,assign) UIImage *userPicture;
@end
