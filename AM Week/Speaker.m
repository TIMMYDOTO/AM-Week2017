//
//  Speaker.m
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "Speaker.h"

@implementation Speaker

- (id) init {
    self = [super init];
    
    return self;
}

- (id) initSpeakerWithDict: (NSDictionary*) dict {
    
    self = [super init];
    if (self) {
        _name = dict[@"speakerName"];
        _imageURL = dict[@"imageURL"];
        _shortInfo = dict[@"shortInfo"];
        _longInfo = dict[@"longInfo"];
        
    }
    return self;
}

@end
