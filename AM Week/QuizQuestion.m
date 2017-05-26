//
//  QuizQuestion.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/3/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QuizQuestion.h"
#import "Quiz.h"

@interface QuizQuestion () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *answer;
@end

@implementation QuizQuestion

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    self.navigationItem.title = _quiz.title;
    self.ref = [[FIRDatabase database] reference];
    NSLog(@"**** Title: %@ \n Question: %@",_quiz.title,_quiz.question);
    
    if (_quiz.codeSnippet) {
        [_quiz.question stringByAppendingFormat:@"\n\n\n\n%@",_quiz.codeSnippet];
    }
    [_textView setText:[_quiz.question stringByReplacingOccurrencesOfString: @"\\n" withString: @"\n"]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [_answer addTarget:self action:@selector(submit:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

-(void)dismissKeyboard {
    [_answer resignFirstResponder];
}

- (void)keyboardDidHide:(NSNotification*)notification {
    NSLog(@"keyboardDidHide");
    [_answer setFrame:CGRectMake(16, 483, _answer.frame.size.width, _answer.frame.size.height)];
}
- (void)keyboardDidShow:(NSNotification*)notification {
    NSLog(@"keyboardDidShow");
    [_answer setFrame:CGRectMake(16, 87, _answer.frame.size.width, _answer.frame.size.height)];
}

- (IBAction)submit:(UIButton *)sender {
    self.ref = [[FIRDatabase database] reference];
    [[[[[_ref child:@"quizzes"]  child:_quiz.title] child:@"userAnswers"]childByAutoId] setValue:_answer.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
