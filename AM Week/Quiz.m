//
//  Quiz.m
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

- (id) init {
    self = [super init];
    
    return self;
}

- (id) initQuizzesWithDict: (NSDictionary*) dict {
    
    self = [super init];
    if (self) {
        _title = dict[@"title"];
        _question = dict[@"conditions"];
        _time = dict[@"time"];
        _date = dict[@"date"];
        _codeSnippet = dict[@"codeSnippet"];
        _questionId = dict[@"questionId"];
        _winner = dict[@"winner"];
    }
    return self;
}

@end
