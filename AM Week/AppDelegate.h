//
//  AppDelegate.h
//  AM Week
//
//  Created by Artiom Schiopu on 4/18/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

