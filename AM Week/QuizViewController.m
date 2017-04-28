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

@import FirebaseDatabase;

@interface QuizViewController (){
    FIRDatabaseHandle refHandle;
}
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSMutableArray<FIRDataSnapshot *> *quizzes;
@property(nonatomic, weak) IBOutlet UITableView *quizTable;
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getFirebaseQuizzes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) getFirebaseQuizzes{
    _ref = [[FIRDatabase database] reference];
    refHandle = [[_ref child:@"quizzes"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){
        NSMutableDictionary *localResult = snapshot.value;
//        [_quizTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_quizzes.count inSection:0]] withRowAnimation: UITableViewRowAnimationAutomatic];
        
//        [FirebaseService getAllQuizzes:localResult];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _quizzes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QuizCell *cell = [_quizTable dequeueReusableCellWithIdentifier:@"QuizCell" forIndexPath:indexPath];
    
//    [cell setupContentWithDictionary:_quizzes[indexPath.row]];
    
    
    return cell;
}

@end
