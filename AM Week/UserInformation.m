//
//  Google.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/2/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "UserInformation.h"

@interface UserInformation ()
@end

@implementation UserInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;

    [self.signInButton setStyle:kGIDSignInButtonStyleIconOnly];
    GIDSignIn *signInButton = [GIDSignIn sharedInstance];
    signInButton.delegate = self;
    
    [self hasInternet];
    if ([GIDSignIn sharedInstance].currentUser) {
        [self signIn:[GIDSignIn sharedInstance] didSignInForUser:[GIDSignIn sharedInstance].currentUser withError:nil];
    }
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    if ([GIDSignIn sharedInstance].currentUser) {
        self.separatorView.alpha = 0;
        self.name.text = user.profile.name;
        self.email.text = user.profile.email;
        if ([GIDSignIn sharedInstance].currentUser.profile.hasImage)
        {
                NSURL *imageURL = [user.profile imageURLWithDimension:100];
     
            [self.image sd_setImageWithURL:imageURL];
            self.image.layer.cornerRadius = self.image.frame.size.height/2;
            self.image.layer.masksToBounds = YES;
        }
    }
}

-(void)hasInternet {
    Reachability *reach = [Reachability reachabilityWithHostName:@"gooogle.com"];
    NetworkStatus internetStat = [reach currentReachabilityStatus];
    if (internetStat == NotReachable) {
 
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"YOUR INTERNET IS OFFLINE" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)signOut:(id)sender {
    
    NSLog(@"SIGNED OUT");
     [[GIDSignIn sharedInstance] signOut];
    self.separatorView.alpha = 1;
    self.name.text = nil;
    self.email.text = nil;
    _image.image = [UIImage imageNamed:@"person"];
    
    NSLog(@"YOU ARE SIGNED OUT");
}

@end
