//
//  Training.h
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Training : NSObject

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *longInfo;
@property (strong, nonatomic) NSNumber *numberOfParticipants;
@property BOOL remoteCall;
@property (strong, nonatomic) NSString *shortInfo;

@end
