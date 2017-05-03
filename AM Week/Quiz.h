//
//  Quiz.h
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *answers;
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *stream;
@property (strong, nonatomic) NSString *questionId;
@property (strong, nonatomic) NSString *stream;

- (id) initQuizzesWithDict: (NSDictionary*) dict ;

@end
