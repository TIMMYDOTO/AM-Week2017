//
//  FirebaseService.h
//  AM Week
//
//  Created by Ion Verdes on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AMWPeople,
    AMWTrainings,
    AMWQuizzes
} AMWScope;

typedef void (^FireBaseCompletionBlock)(NSMutableArray* result, NSError* error);


@interface FirebaseService : NSObject

- (NSMutableArray*) getAllTrainings: (NSMutableDictionary*) dict;
- (NSMutableArray*) getAllQuizzes: (NSMutableDictionary*) dict;
- (void) getFirebase;
+ (id) sharedManager;
- (void) getFirebase: (AMWScope) scope andCompletionBlock: (FireBaseCompletionBlock) completionBlock;

@end
