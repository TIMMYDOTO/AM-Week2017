//
//  QuizCell.m
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QuizCell.h"

@interface QuizCell()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *timeDate;

@end

@implementation QuizCell

- (void) setupContentWithDictionary:(Quiz *)dict{


}

@end
