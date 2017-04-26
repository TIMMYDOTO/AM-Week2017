//
//  Service.m
//  AM Week
//
//  Created by Ion Verdes on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "FireBaseService.h"
@import FirebaseDatabase;

typedef enum {
    AMWPeople,
    AMWTrainings
} AMWScope;


@interface FireBaseService() {
    FIRDatabaseHandle refHandle;
    FIRDatabaseReference *ref;
}

  
@end

@implementation FireBaseService


+ (id)sharedManager {
    static FireBaseService *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void) getScheduleForDate: (NSDate*) date completionBlock: (FireBaseCompletionBlock) completionBlock{
    [self getValuesForScope:AMWTrainings andCompletionBlock:completionBlock];
}

//+ (NSDictionary*) getAllData{
//    return <#expression#>
//}

+ (NSMutableArray*) getAllTrainings: (NSMutableDictionary*) dict{
    
    NSMutableArray* trainings = [dict objectForKey:@"trainings"];
//    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
//    
//    for (NSDictionary* training in trainings) {
//        NSMutableDictionary* newTraining = [[NSMutableDictionary alloc] init];
//        
//        newTraining[@"title"] = training[@"Name"];
//        newTraining[@"date"] = training[@"date"];
//        newTraining[@"day"] = training[@"day"];
//        newTraining[@"location"] = training[@"location"];
//        newTraining[@"loginfo"] = training[@"loginfo"];
//        newTraining[@"numberofparticipants"] = training[@"numberofparticipants"];
//        newTraining[@"remotecall"] = training[@"remotecall"];
//        newTraining[@"shortinfo"] = training[@"shortinfo"];
//        newTraining[@"time"] = training[@"time"];
//        
//        [allInfo addObject:newTraining];
//    }
    NSLog(@"%@", trainings);
    return  trainings;
}

- (void) getValuesForScope: (AMWScope) scope andCompletionBlock: (FireBaseCompletionBlock) completionBlock{
    ref = [[FIRDatabase database] reference];
    
//    NSArray* scopeTitles = @[@"people",@"trainings"];
    
    refHandle = [ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){
        NSMutableDictionary *localResult = snapshot.value;
//        NSLog(@"ceva%@", localResult);
        
        [FireBaseService getAllTrainings:localResult];
        
        /*
        if (errr) {
        if (completionBlock) {
        completionBlock(nil,error);
        }
        }
        else  */
//        if ([localResult isKindOfClass:[NSArray class]]) {
//            
//            
//            if (completionBlock) {
//                completionBlock([NSMutableArray arrayWithArray:[self arrayForScope:scope fromObject:localResult]],nil);
//            }
//        } else {
//            // dictionary
//        }
        
    }];
}

//- (NSArray*) arrayForScope: (AMWScope) scope fromObject: (id) primaryValue  {
//    
//    NSMutableArray* returnResult = [[NSMutableArray alloc] init];
//    switch (scope) {
//        case AMWTrainings: {
//            NSMutableArray* result = [[NSMutableArray alloc] init];
//
//            returnResult = result;
//        }
//        default: returnResult = nil;
//            break;
//    }
//    return returnResult;
//}

@end
