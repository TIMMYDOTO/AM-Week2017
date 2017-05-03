//
//  QuizQuestion.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/3/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QuizQuestion.h"

@interface QuizQuestion () <UITextFieldDelegate>

@end

@implementation QuizQuestion

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ref = [[FIRDatabase database] reference];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
    [_answer addTarget:self action:@selector(submit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_answer addTarget:self action:@selector(dismissKeyboard) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (void)keyboardWillShow:(NSNotification *)n
//{
//    if (keyboardShown) { return; }
//    NSDictionary* userInfo = [n userInfo];
//    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    CGRect activeViewFrameInsideGlobalView = [_smallView convertRect:activeView.frame toView:self.view];
//    CGFloat viewBotomLine = activeViewFrameInsideGlobalView.origin.y+activeViewFrameInsideGlobalView.size.height;
//    CGFloat keyboardTopLine = self.view.frame.size.height-keyboardSize.height;
//    CGFloat overlapDistance = viewBotomLine-keyboardTopLine;
//    
//    if (overlapDistance>0) {
//        __block CGRect viewRect = self.view.frame;
//        viewRect.origin.y = viewRect.origin.y-overlapDistance;
//        [UIView animateWithDuration:0.5 animations:^{
//            self.view.frame = viewRect;
//        } completion:^(BOOL finished) { }];
//    }
//    keyboardShown = YES;
//}

- (void)keyboardDidHide:(NSNotification*)notification {
    NSLog(@"keyboardDidHide");
    [self.view setFrame:CGRectMake(0, 20, 375, 667)];
}
- (void)keyboardDidShow:(NSNotification*)notification {
    NSLog(@"keyboardDidShow");
    [self.view setFrame:CGRectMake(0, -240, 375, 667)];
}
- (IBAction)submit:(UIButton *)sender {
    NSLog(@"valera");
 //   [[[[[_ref child:@"quizzes"]  child:@"androiodone"] child:@"answers"]childByAutoId] setValue:_answer.text];
    
}
-(void)dismissKeyboard {
    [_answer resignFirstResponder];
    
}
@end
