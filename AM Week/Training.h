//
//  Training.h
//  AM Week
//
//  Created by Dorin Popa on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Training : NSObject
{
 @public   NSString *imageURL;
}


@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *stream;
@property (strong, nonatomic) NSString *location;
@property BOOL remoteCall;
@property (strong, nonatomic) NSString *description;

@property (strong, nonatomic) NSString *speaker;
@property (strong, nonatomic) NSString *trainingId;
@property (strong, nonatomic) NSString *speakerImage;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *shortInfo;
@property (strong, nonatomic) NSString *longInfo;
- (id) initTrainingWithDict: (NSDictionary*) dict ;

@end
