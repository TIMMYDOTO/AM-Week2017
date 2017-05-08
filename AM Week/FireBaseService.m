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
    NSMutableDictionary* speakers = [dict objectForKey:@"speakers"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    [trainings enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull trainingObj, BOOL * _Nonnull stop) {
        
        NSMutableDictionary* newTraining = [[NSMutableDictionary alloc] init];
      //   NSMutableDictionary* newTrainingg = [[NSMutableDictionary alloc] init];
        
        newTraining[@"title"] = trainingObj[@"title"];
        newTraining[@"time"] = [NSString stringWithFormat:@"%@ - %@", trainingObj[@"timeStart"], trainingObj[@"timeEnd"]];
        newTraining[@"date"] = trainingObj[@"date"];
        newTraining[@"day"] = trainingObj[@"day"];
        newTraining[@"location"] = trainingObj[@"location"];
        newTraining[@"description"] = trainingObj[@"description"];
        newTraining[@"remoteCall"] = trainingObj[@"remoteCall"];
        newTraining[@"stream"] = trainingObj[@"stream"];
        newTraining[@"speaker"] = [trainingObj[@"speakerId"] stringValue];
        newTraining[@"language"] = trainingObj[@"language"];
        
        [speakers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull speakerObj, BOOL * _Nonnull stop) {
            if ([[speakerObj[@"id"] stringValue] isEqualToString: newTraining[@"speaker"]]) {
                newTraining[@"speaker"] = [NSString stringWithFormat:@"%@",speakerObj[@"name"]];
                newTraining[@"speakerImage"] = [NSString stringWithFormat:@"%@",speakerObj[@"imageId"]];
                
            
           }
          
          
        }];
//        [speakers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull speakerObjj, BOOL * _Nonnull stop) {
//            NSLog(@"speakerObjj in speakers ");
//            if ([[speakerObjj[@"id"] stringValue] isEqualToString: newTrainingg[@"speaker"]]) {
//                newTrainingg[@"speaker"] = [NSString stringWithFormat:@"%@",speakerObjj[@"imageId"]];
//                NSLog(@"NSString stringWithFormat: %@", [NSString stringWithFormat:@"%@",speakerObjj[@"imageId"]]);
//            }
//        }];
        newTraining[@"trainingId"] = trainingObj[@"id"];
        newTraining[@"timeStart"] = trainingObj[@"timeStart"];
        newTraining[@"timeEnd"] = trainingObj[@"timeEnd"];
        newTraining[@"type"] = trainingObj[@"type"];
        
        [allInfo addObject:[[Training alloc] initTrainingWithDict:newTraining]];
      
    }];
   
    if (completionBlock)
        completionBlock(allInfo,nil);
    
    return allInfo;
}

- (NSMutableArray*) getAllQuizzes: (NSMutableDictionary*) dict andCompletionBlock:(FireBaseCompletionBlock) completionBlock {
    
    NSMutableDictionary* quizzes = [dict objectForKey:@"quizzes"];
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    [quizzes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull quizObj, BOOL * _Nonnull stop) {
        
        NSMutableDictionary* newQuiz = [[NSMutableDictionary alloc] init];

        newQuiz[@"title"] = quizObj[@"title"];
        newQuiz[@"question"] = quizObj[@"question"];
        newQuiz[@"stream"] = quizObj[@"stream"];
        newQuiz[@"answers"] = quizObj[@"answers"];
        newQuiz[@"time"] = quizObj[@"time"];
        newQuiz[@"date"] = quizObj[@"date"];
        newQuiz[@"questionId"] = quizObj[@"questionId"];


        
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
        if(scope == AMWTrainings){
            [[FirebaseService sharedManager] getAllTrainings:localResult andCompletionBlock:completionBlock];
        }else{
            [[FirebaseService sharedManager] getAllQuizzes:localResult andCompletionBlock:completionBlock];
        }
    }];
}

@end
