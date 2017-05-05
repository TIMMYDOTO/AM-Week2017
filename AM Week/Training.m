//
//  Training.m
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "Training.h"

@implementation Training

- (id) init {
    self = [super init];
    
    return self;
}

- (id) initTrainingWithDict: (NSDictionary*) dict {
    
    self = [super init];
    if (self) {
        _title = dict[@"title"];
        _time = dict[@"time"];
        _speaker = dict[@"speaker"];
        _stream = dict[@"stream"];
        _speakerImage = dict[@"speakerImage"];
      
    }
    return self;
}

@end
