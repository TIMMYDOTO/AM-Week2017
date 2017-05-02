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
@property(nonatomic, weak) IBOutlet UITableView *trainingTable;
@end

@implementation TrainingViewController
@synthesize trainingTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.date = [self dateForSelectedTab];
    self.navigationItem.title = [self dateTitleFromDate:self.date];
    
    _trainings = [[NSMutableArray alloc] init];
    
    [[FirebaseService sharedManager] getFirebase:(AMWTrainings) andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _trainings = result;
        [trainingTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_trainings.count-1 inSection:0]] withRowAnimation: UITableViewRowAnimationAutomatic];
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

-(NSString*) dateTitleFromDate:(NSDate*) date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM, EEEE"];
    NSString *weekDayText = [formatter stringFromDate:date];
    
    return weekDayText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _trainings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TrainingCell *cell = [trainingTable dequeueReusableCellWithIdentifier:@"TrainingCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupContentWithQuiz:_trainings[indexPath.row]];
    
    return cell;
}


@end