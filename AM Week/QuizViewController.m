//
//  QuizViewController.m
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QuizViewController.h"
#import "FirebaseService.h"
#import "QuizCell.h"
#import "Quiz.h"

@import FirebaseDatabase;

@interface QuizViewController ()

@property (strong, nonatomic) NSMutableArray *quizzes;
@property(nonatomic, weak) IBOutlet UITableView *quizTable;

@end

@implementation QuizViewController
@synthesize quizTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    _quizzes = [[NSMutableArray alloc] init];
    
    [[FirebaseService sharedManager] getFirebase:(AMWQuizzes) andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _quizzes = result;
        [quizTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_quizzes.count-1 inSection:0]] withRowAnimation: UITableViewRowAnimationAutomatic];
        [quizTable reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _quizzes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QuizCell *cell = [quizTable dequeueReusableCellWithIdentifier:@"QuizCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupContentWithQuiz:_quizzes[indexPath.row]];
    
    return cell;
}

@end
