//
//  QuizCell.m
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QuizCell.h"
#import "Quiz.h"

@interface QuizCell()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation QuizCell

- (void) setupContentWithQuiz:(Quiz *)quiz{
    _quiz = quiz;
    
    _title.text = _quiz.title;
    _date.text = _quiz.date;
    _time.text = _quiz.time;
}

@end
