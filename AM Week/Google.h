//
//  Google.h
//  AM Week
//
//  Created by Artiom Schiopu on 4/28/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
@interface Google : UIViewController <GIDSignInUIDelegate, GIDSignInDelegate>
- (IBAction)SingOut:(id)sender;

@end
