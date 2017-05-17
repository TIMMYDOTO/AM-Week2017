//
//  SpeakerDeatails.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "SpeakerDeatails.h"
#import "ENMBadgedBarButtonItem.h"

@interface SpeakerDeatails ()
@interface SpeakerDeatails (){
    NSDictionary *dict;
    FIRDatabaseHandle refHandle;
}

@property (nonatomic, strong) ENMBadgedBarButtonItem *navButton;
@end

@implementation SpeakerDeatails

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SpeakerDeatails");
    
    refHandle = [[[[FIRDatabase database] reference] child:@"quizzes"]  observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        dict = snapshot.value;
        self.navButton.badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)dict.count];
    }];
    [self setupQuizButton];
}

- (void) setupQuizButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Quizzes" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.frame = CGRectMake(0, 0, 67, 30);
    [button addTarget:self action:@selector(showQuzzies) forControlEvents:UIControlEventTouchDown];
    
    self.navButton = [[ENMBadgedBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = self.navButton;
}

-(void)showQuzzies {
    [self performSegueWithIdentifier:@"segueToQuizzes" sender:nil];
}


@end
