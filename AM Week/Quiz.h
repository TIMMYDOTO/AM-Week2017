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
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *questionId;

- (id) initQuizWithDict: (NSDictionary*) dict ;

@end
