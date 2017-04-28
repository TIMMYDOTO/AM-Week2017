//
//  Service.h
//  AM Week
//
//  Created by Ion Verdes on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^FireBaseCompletionBlock)(NSArray* result, NSError* error);


@interface FirebaseService : NSObject

+ (void) getAllTrainings: (NSMutableDictionary*) dict;
+ (NSMutableArray*) getAllQuizzes: (NSMutableDictionary*) dict;
+ (void) getFirebase;
+ (id)sharedManager;

@end
