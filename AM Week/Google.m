//
//  Google.m
//  AM Week
//
//  Created by Artiom Schiopu on 4/28/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "Google.h"
#import "AppDelegate.h"
@interface Google ()

@end

@implementation Google

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"GOOGLE SIGN");
    [GIDSignIn sharedInstance].uiDelegate = self;
    GIDSignInButton *loginButtonG = [[GIDSignInButton alloc]init];
    loginButtonG.center = self.view.center;
    [self.view addSubview:loginButtonG];
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSLog(@"didSignInForUser");
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    
    
    // ...
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SingOut:(id)sender {
        [[GIDSignIn sharedInstance] signOut];
}
@end
