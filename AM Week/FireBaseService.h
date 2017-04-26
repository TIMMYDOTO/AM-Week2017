//
//  Service.h
//  AM Week
//
//  Created by Ion Verdes on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^FireBaseCompletionBlock)(NSArray* result, NSError* error);


@interface FireBaseService : NSObject

+ (NSDictionary*) getAllData;
+ (NSMutableArray*) getAllTrainings;
+ (id)sharedManager;
- (void) getScheduleForDate: (NSDate*) date completionBlock: (FireBaseCompletionBlock) completionBlock;

@end
