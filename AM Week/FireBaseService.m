//
//  FirebaseService.m
//  AM Week
//
//  Created by Ion Verdes on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "FirebaseService.h"
#import "Training.h"
#import "Quiz.h"
#import "Speaker.h"

@import FirebaseDatabase;

@interface FirebaseService(){
    FIRDatabaseHandle refHandle;
    FIRDatabaseReference *ref;
}
@end

@implementation FirebaseService

+ (id)sharedManager {
    static FirebaseService *sharedMyManager = nil;
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

- (NSMutableArray*) getAllTrainings: (NSMutableDictionary*) dict forDay:(NSString*) day andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    
    NSMutableDictionary* trainings = [dict objectForKey:@"trainings"];
    NSMutableDictionary* speakers = [dict objectForKey:@"speakers"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];

    [trainings enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull trainingObj, BOOL * _Nonnull stop) {
    
        NSMutableDictionary* newTraining = [[NSMutableDictionary alloc] init];
   
        if([[trainingObj[@"day"] stringValue] isEqualToString:day]){
            
            newTraining[@"title"] = trainingObj[@"title"];
            newTraining[@"time"] = trainingObj[@"timeStart"];
            newTraining[@"fullTime"] = [NSString stringWithFormat:@"%@ - %@", trainingObj[@"timeStart"], trainingObj[@"timeEnd"]];
            newTraining[@"date"] = trainingObj[@"date"];
            newTraining[@"day"] = trainingObj[@"day"];
            newTraining[@"location"] = trainingObj[@"location"];
            newTraining[@"description"] = trainingObj[@"description"];
            newTraining[@"remoteCall"] = trainingObj[@"remoteCall"];
            newTraining[@"stream"] = trainingObj[@"stream"];
            newTraining[@"speakerID"] = [trainingObj[@"speakerId"] stringValue];
            newTraining[@"language"] = trainingObj[@"language"];
        
            [speakers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull speakerObj, BOOL * _Nonnull stop) {
                if ([[speakerObj[@"id"] stringValue] isEqualToString: newTraining[@"speakerID"]]) {
                    newTraining[@"speaker"] = [NSString stringWithFormat:@"%@",speakerObj[@"name"]];
                    newTraining[@"speakerImage"] = [NSString stringWithFormat:@"%@",speakerObj[@"imageId"]];
                }
            }];

            newTraining[@"trainingId"] = trainingObj[@"id"];
            newTraining[@"timeStart"] = trainingObj[@"timeStart"];
            newTraining[@"timeEnd"] = trainingObj[@"timeEnd"];
            newTraining[@"type"] = trainingObj[@"type"];
            newTraining[@"id"] = trainingObj[@"id"];
        
            [allInfo addObject:[[Training alloc] initTrainingWithDict:newTraining]];
        }
    }];
   
    NSArray *sortedArray;
    sortedArray = [allInfo sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(Training*)a time];
        NSString *second = [(Training*)b time];
        return [first compare:second];
    }];
    
    if (completionBlock)
        completionBlock((NSMutableArray*)sortedArray,nil);
    
    return allInfo;
}

- (NSMutableArray*) getAllQuizzes: (NSMutableDictionary*) dict andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    
    NSMutableDictionary* quizzes = [dict objectForKey:@"quizzes"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    [quizzes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull quizObj, BOOL * _Nonnull stop) {
        
        [allInfo addObject:[[Quiz alloc] initQuizzesWithDict: quizObj]];
    }];
    
    if (completionBlock)
        completionBlock(allInfo,nil);
    
    return allInfo;
}

- (NSMutableArray*) getSpeaker: (NSMutableDictionary*) dict forSpeakerID:(NSString*) spId andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    
    NSMutableDictionary* quizzes = [dict objectForKey:@"speakers"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    [quizzes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull speakerObj, BOOL * _Nonnull stop) {
        
        NSMutableDictionary* newSpeaker = [[NSMutableDictionary alloc] init];
        
        if([[speakerObj[@"id"] stringValue] isEqualToString:spId]){
            newSpeaker[@"speakerName"] = speakerObj[@"name"];
            newSpeaker[@"shortInfo"] = speakerObj[@"shortInfo"];
            newSpeaker[@"longInfo"] = speakerObj[@"longInfo"];
            newSpeaker[@"imageURL"] = speakerObj[@"imageId"];
        
            [allInfo addObject:[[Speaker alloc] initSpeakerWithDict:newSpeaker]];
        }
    }];
    
    if (completionBlock)
        completionBlock(allInfo,nil);
    
    return allInfo;
}

- (void) getFirebase: (AMWScope) scope day: (NSString*) day speakerID: (NSString*) spId andCompletionBlock: (FireBaseCompletionBlock) completionBlock {
    ref = [[FIRDatabase database] reference];
    refHandle = [ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){
        NSMutableDictionary *localResult = snapshot.value;
        if(scope == AMWTrainings){
            [[FirebaseService sharedManager] getAllTrainings:localResult forDay:day andCompletionBlock:completionBlock];
        } else if(scope == AMWQuizzes) {
            [[FirebaseService sharedManager] getAllQuizzes:localResult andCompletionBlock:completionBlock];
        } else if(scope == AMWSpeaker){
            [[FirebaseService sharedManager] getSpeaker:localResult forSpeakerID: spId andCompletionBlock:completionBlock];
        }
    }];
}

@end
