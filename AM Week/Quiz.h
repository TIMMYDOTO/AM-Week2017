//
//  Quiz.h
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property (strong, nonatomic) NSArray *answers;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *pubishDate;
@property (strong, nonatomic) NSString *winner;

@end
