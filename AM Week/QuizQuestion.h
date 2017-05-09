//
//  QuizQuestion.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/3/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <Canvas/Canvas.h>
@interface QuizQuestion : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) IBOutlet UILabel *labelForCode;
@property (strong, nonatomic) IBOutlet UITextField *answer;
@property (strong, nonatomic) IBOutlet UIView *smallView;



- (IBAction)submit:(UIButton *)sender;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end
