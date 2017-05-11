//
//  AppDelegate.h
//  AM Week
//
//  Created by Artiom Schiopu on 4/18/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Firebase;
@import GoogleSignIn;

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate,FIRMessagingDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

