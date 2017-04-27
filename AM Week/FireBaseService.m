//
//  Service.m
//  AM Week
//
//  Created by Ion Verdes on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "FireBaseService.h"
#import "Training.h"

@import FirebaseDatabase;

typedef enum {
    AMWPeople,
    AMWTrainings
} AMWScope;


@interface FireBaseService(){
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

+ (void) getAllTrainings: (NSMutableDictionary*) dict withCompletionBlock:(FireBaseCompletionBlock) completionBlock{
    
    NSMutableDictionary* trainings = [dict objectForKey:@"trainings"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    [trainings enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSMutableDictionary* newTraining = [[NSMutableDictionary alloc] init];
        
        newTraining[@"title"] = obj[@"title"];
        newTraining[@"date"] = obj[@"date"];
        newTraining[@"day"] = obj[@"day"];
        newTraining[@"location"] = obj[@"location"];
        newTraining[@"longInfo"] = obj[@"longInfo"];
        newTraining[@"remoteCall"] = obj[@"remoteCall"];
        newTraining[@"shortInfo"] = obj[@"shortInfo"];
        newTraining[@"time"] = obj[@"time"];
        newTraining[@"speakerId"] = obj[@"speakerId"];
        newTraining[@"trainingId"] = obj[@"id"];
        
        [allInfo addObject:[[Training alloc] initTrainingWithDict:newTraining]];
    }];
   
    NSLog(@"%@", allInfo);
    if (completionBlock) {
        completionBlock(allInfo,nil);
    }
}

- (void) getValuesForScope: (AMWScope) scope andCompletionBlock: (FireBaseCompletionBlock) completionBlock{
    ref = [[FIRDatabase database] reference];
    
    refHandle = [ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){
        NSMutableDictionary *localResult = snapshot.value;
        
        [FireBaseService getAllTrainings:localResult withCompletionBlock:completionBlock];

    }];
}

@end
