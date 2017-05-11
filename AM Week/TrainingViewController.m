//
//  TrainingViewController.m
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingViewController.h"
#import "FirebaseService.h"
#import "TrainingCell.h"
#import "Training.h"

@interface TrainingViewController ()

@property (strong, nonatomic) NSMutableArray *trainings;
@end

@implementation TrainingViewController
@synthesize trainingTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.date = [self dateForSelectedTab];
    self.navigationItem.title = [self dateTitleFromDate:self.date];
    
    _trainings = [[NSMutableArray alloc] init];
    
    [[FirebaseService sharedManager] getFirebase:(AMWQuizzes) day:nil  andCompletionBlock:^(NSMutableArray* result, NSError* error) {
        [_animationView startCanvasAnimation];
    }];
    
    [[FirebaseService sharedManager] getFirebase:(AMWTrainings) day: [NSString stringWithFormat:@"%lu",self.tabBarController.selectedIndex+1] andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _trainings = result;
        [trainingTable reloadData];
    }];
}

- (NSDate*) dateForSelectedTab {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:22 + self.tabBarController.selectedIndex];
    [comps setMonth:5];
    [comps setYear:2017];
    
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

- (NSString*) dateTitleFromDate:(NSDate*) date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM, EEEE"];
    NSString *weekDayText = [formatter stringFromDate:date];
    
    return weekDayText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _trainings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TrainingCell *cell = [trainingTable dequeueReusableCellWithIdentifier:@"TrainingCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupContentWithTraining:_trainings[indexPath.row]];
    
    return cell;
}

@end
