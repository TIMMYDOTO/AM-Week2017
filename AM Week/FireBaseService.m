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

- (NSMutableArray*) getAllTrainings: (NSMutableDictionary*) dict andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    
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
   
    if (completionBlock)
        completionBlock(allInfo,nil);
    
    return allInfo;
}

- (NSMutableArray*) getAllQuizzes: (NSMutableDictionary*) dict andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    
    NSMutableDictionary* quizzes = [dict objectForKey:@"quizzes"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    [quizzes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSMutableDictionary* newQuiz = [[NSMutableDictionary alloc] init];
        
        newQuiz[@"question"] = obj[@"question"];
        newQuiz[@"answers"] = obj[@"answers"];
        newQuiz[@"date"] = obj[@"date"];
        newQuiz[@"time"] = obj[@"time"];
        newQuiz[@"questionId"] = obj[@"questionId"];
        
        [allInfo addObject:[[Quiz alloc] initQuizzesWithDict:newQuiz]];
    }];
    
    if (completionBlock)
        completionBlock(allInfo,nil);
    
    return allInfo;
}

- (void) getFirebase:(AMWScope) scope andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    ref = [[FIRDatabase database] reference];
    refHandle = [ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){
        NSMutableDictionary *localResult = snapshot.value;
        
        [[FirebaseService sharedManager] getAllQuizzes:localResult andCompletionBlock:completionBlock];
//        [[FirebaseService sharedManager] getAllTrainings:localResult andCompletionBlock:completionBlock];
    }];
}

@end
