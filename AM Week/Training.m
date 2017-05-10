//
//  Training.m
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "Training.h"

@implementation Training
@synthesize description;
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
        _language = dict[@"language"];
        _location = dict[@"location"];
        description = dict[@"description"];
        _date = dict[@"date"];
        _type = dict[@"type"];
        _shortInfo = dict[@"shortInfo"];
        _longInfo = dict[@"longInfo"];
    }
    return self;
}

@end
