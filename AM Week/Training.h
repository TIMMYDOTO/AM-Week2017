//
//  Training.h
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Training : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *timeDate;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSNumber *location;
@property BOOL remoteCall;
@property (strong, nonatomic) NSString *shortInfo;
@property (strong, nonatomic) NSString *longInfo;
@property (strong, nonatomic) NSString *speaker;
@property (strong, nonatomic) NSString *trainingId;

- (id) initTrainingWithDict: (NSDictionary*) dict ;

@end
