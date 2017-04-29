//
//  TrainingCell.h
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Training;

@interface TrainingCell : UITableViewCell

@property (retain, nonatomic) Training* training;

- (void) setupContentWithQuiz:(Training *)training;

@end
