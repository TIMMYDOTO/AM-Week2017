//
//  Speaker.h
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Speaker : NSObject

@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *shortInfo;
@property (strong, nonatomic) NSString *longInfo;
@property (strong, nonatomic) NSArray *trainings;

@end
