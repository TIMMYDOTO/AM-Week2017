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

@class Quiz;

@interface QuizQuestion : UIViewController
@property (retain,nonatomic) Quiz* quiz;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end
