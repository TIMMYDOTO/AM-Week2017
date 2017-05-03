//
//  Google.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/2/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "Google.h"

@interface Google (){
    
}

@end

@implementation Google

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view.
    [GIDSignIn sharedInstance].uiDelegate = self;

    [self.signInButton setStyle:kGIDSignInButtonStyleIconOnly];
    GIDSignIn *signInButton = [GIDSignIn sharedInstance];
    signInButton.delegate = self;
    [self hasInternet];
 //   [[GIDSignIn sharedInstance] signIn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    self.name.text = user.profile.name;
    self.email.text = user.profile.email;
    if ([GIDSignIn sharedInstance].currentUser.profile.hasImage)
    {
            NSURL *imageURL = [user.profile imageURLWithDimension:100];
     
        [self.image sd_setImageWithURL:imageURL];
        self.image.layer.cornerRadius = self.image.frame.size.height/2;
        self.image.layer.masksToBounds = YES;
    NSLog(@"%@",imageURL);
    }
 
}
-(void)hasInternet{
    Reachability *reach = [Reachability reachabilityWithHostName:@"gooogle.com"];
    NetworkStatus internetStat = [reach currentReachabilityStatus];
    if (internetStat == NotReachable) {
 
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"YOUR INTERNET IS OFFLINE" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
      
    }
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signOut:(id)sender {
    NSLog(@"SIGNED OUT");
     [[GIDSignIn sharedInstance] signOut];
    self.name.text = nil;
    self.email.text = nil;
    _image.image = [UIImage imageNamed:@"person"];
    
    NSLog(@"YOU ARE SIGNED OUT");
}
@end
