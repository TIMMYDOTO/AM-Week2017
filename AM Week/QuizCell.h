//
//  QuizCell.h
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quiz;

@interface QuizCell : UITableViewCell

@property (retain, nonatomic) Quiz* quiz;

- (void) setupContentWithDictionary: (Quiz*) dict;

@end
