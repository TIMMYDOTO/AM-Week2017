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
    _question = dict[@"question"];
    _date = dict[@"timeDate"];
   _stream = dict[@"stream"];
    }
    return self;
}

@end
