//
//  Google.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/2/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Reachability.h"
@import GoogleSignIn;
@import Firebase;
@interface UserInformation : UIViewController <GIDSignInUIDelegate, GIDSignInDelegate>{
    
}
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
@property(strong, nonatomic) IBOutlet UIView *separatorView;
- (IBAction)signOut:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;

    
@end
