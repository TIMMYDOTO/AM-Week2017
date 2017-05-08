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

+ (id) sharedManager;
- (void) getFirebase: (AMWScope) scope day: (NSString*) day andCompletionBlock: (FireBaseCompletionBlock) completionBlock;

@end
